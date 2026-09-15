#!/usr/bin/env python3
"""Update only from a published stable release with matching asset checksums."""
import hashlib
import json
import os
from pathlib import Path
import re
import urllib.request

REPOSITORY = "dergigi/goop"
ROOT = Path(__file__).resolve().parents[1]


def fetch(url):
    headers = {"User-Agent": "goop-homebrew-update"}
    if url.startswith("https://api.github.com/") and os.environ.get("GH_TOKEN"):
        headers["Authorization"] = "Bearer " + os.environ["GH_TOKEN"]
    with urllib.request.urlopen(urllib.request.Request(url, headers=headers), timeout=60) as response:
        return response.read()


def validated_release(release, manifest):
    tag = release["tag_name"]
    if release["draft"] or release["prerelease"] or not re.fullmatch(r"v(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)", tag):
        raise ValueError("Expected a published stable SemVer release")
    assets = {a["name"]: a for a in release["assets"]}
    if len(assets) != len(release["assets"]):
        raise ValueError("Duplicate release assets")
    base = f"https://github.com/{REPOSITORY}/releases/download/{tag}/"
    checksum_asset = assets["SHA256SUMS"]
    if checksum_asset["browser_download_url"] != base + "SHA256SUMS":
        raise ValueError("Unexpected checksum URL")
    if checksum_asset.get("digest") != "sha256:" + hashlib.sha256(manifest).hexdigest():
        raise ValueError("Checksum manifest does not match GitHub's digest")
    hashes = {}
    for line in manifest.decode().splitlines():
        digest, name = line.split(maxsplit=1)
        name = name.lstrip("*")
        if name in hashes or not re.fullmatch(r"[0-9a-f]{64}", digest):
            raise ValueError("Invalid or duplicate checksum")
        hashes[name] = digest
    result = {}
    for arch in ("arm64", "x64"):
        name = f"goop-macos-{arch}.dmg"
        asset = assets[name]
        if asset["browser_download_url"] != base + name or asset["size"] <= 0:
            raise ValueError("Unexpected installer metadata")
        digest = hashes[name]
        if asset.get("digest") != "sha256:" + digest:
            raise ValueError("Installer checksum does not match GitHub's digest")
        result[arch] = digest
    return tag[1:], result


def update_cask(text, version, hashes):
    old = re.search(r'^  version "([0-9.]+)"$', text, re.M).group(1)
    if tuple(map(int, version.split('.'))) < tuple(map(int, old.split('.'))):
        raise ValueError("Refusing to downgrade the cask")
    text, count = re.subn(r'^  version "[0-9.]+"$', f'  version "{version}"', text, flags=re.M)
    assert count == 1
    for label, arch in (("arm", "arm64"), ("intel", "x64")):
        text, count = re.subn(rf'({label}:\s+")[0-9a-f]{{64}}(")', rf'\g<1>{hashes[arch]}\2', text)
        assert count == 1
    return text


def main():
    release = json.loads(fetch(f"https://api.github.com/repos/{REPOSITORY}/releases/latest"))
    tag = release["tag_name"]
    if not re.fullmatch(r"v\d+\.\d+\.\d+", tag):
        raise ValueError("Unexpected release tag")
    manifest = fetch(f"https://github.com/{REPOSITORY}/releases/download/{tag}/SHA256SUMS")
    version, hashes = validated_release(release, manifest)
    path = ROOT / "Casks/goop.rb"
    old = path.read_text()
    new = update_cask(old, version, hashes)
    if old != new:
        path.write_text(new)
        print(f"Updated Goop to {version}")
    else:
        print(f"Goop {version} is current")


if __name__ == "__main__":
    main()
