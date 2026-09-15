import copy
import hashlib
from pathlib import Path
import unittest
from update import validated_release, update_cask


class UpdateTests(unittest.TestCase):
    def setUp(self):
        self.hashes = {"arm64": "a" * 64, "x64": "b" * 64}
        self.manifest = ''.join(f'{digest}  goop-macos-{arch}.dmg\n' for arch, digest in self.hashes.items()).encode()
        base = 'https://github.com/dergigi/goop/releases/download/v2.5.0/'
        self.release = dict(tag_name='v2.5.0', draft=False, prerelease=False, assets=[
            dict(name=f'goop-macos-{arch}.dmg', browser_download_url=base + f'goop-macos-{arch}.dmg', size=1234, digest='sha256:' + digest)
            for arch, digest in self.hashes.items()
        ] + [dict(name='SHA256SUMS', browser_download_url=base + 'SHA256SUMS', digest='sha256:' + hashlib.sha256(self.manifest).hexdigest())])

    def test_stable_release(self):
        self.assertEqual(validated_release(self.release, self.manifest), ('2.5.0', self.hashes))

    def test_unpublished_and_prerelease_rejected(self):
        for key, value in [('draft', True), ('prerelease', True), ('tag_name', 'v2.6.0-beta.1'), ('tag_name', 'v02.5.0')]:
            with self.subTest(key=key, value=value), self.assertRaises(ValueError):
                validated_release(dict(self.release, **{key: value}), self.manifest)

    def test_tampering_rejected(self):
        with self.assertRaises(ValueError):
            validated_release(self.release, self.manifest.replace(b'a', b'c'))
        for field, value in [('digest', 'sha256:' + 'c' * 64), ('browser_download_url', 'https://example.org/file.dmg')]:
            release = copy.deepcopy(self.release)
            release['assets'][0][field] = value
            with self.assertRaises(ValueError):
                validated_release(release, self.manifest)

    def test_missing_and_duplicate_assets_rejected(self):
        release = copy.deepcopy(self.release)
        release['assets'].pop(0)
        with self.assertRaises(KeyError):
            validated_release(release, self.manifest)
        release = copy.deepcopy(self.release)
        release['assets'].append(release['assets'][0])
        with self.assertRaises(ValueError):
            validated_release(release, self.manifest)

    def test_update_preserves_definition_and_rejects_downgrade(self):
        source = (Path(__file__).resolve().parents[1] / 'Casks/goop.rb').read_text()
        updated = update_cask(source, '99.0.0', self.hashes)
        self.assertIn('version "99.0.0"', updated)
        self.assertIn('homepage "https://goop.dergigi.com/"', updated)
        self.assertIn('app "Goop.app"', updated)
        self.assertIn(self.hashes['arm64'], updated)
        self.assertIn(self.hashes['x64'], updated)
        with self.assertRaises(ValueError):
            update_cask(source, '0.0.1', self.hashes)
