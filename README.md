# Goop Homebrew tap

Install [Goop](https://goop.dergigi.com/), an encrypted Nostr messaging app for macOS:

```sh
brew install --cask dergigi/goop/goop
```

Apple Silicon and Intel Macs are supported. Downloads come directly from [Goop's published releases](https://github.com/dergigi/goop/releases), with SHA-256 verification.

## Updates

Goop has its own updater. To explicitly update through Homebrew:

```sh
brew update
brew upgrade --cask dergigi/goop/goop
```

The tap checks for new published stable releases hourly (GitHub schedules can be delayed). Maintainers can also run the **Update cask** workflow manually. Drafts and prereleases are excluded. Both installer hashes must match the published checksum manifest and GitHub asset metadata before an update is committed.

## Removal

```sh
brew uninstall --cask dergigi/goop/goop
```

Uninstalling leaves your account settings and chat data in place.

## macOS signing

Current releases are ad-hoc signed and are not notarized by Apple. Homebrew installation does not remove macOS's first-launch security checks. This tap does not disable Gatekeeper or remove quarantine attributes.

## Maintenance

```sh
python3 -m unittest discover -s script -p 'test_*.py'
python3 script/update.py
brew audit --cask --strict dergigi/goop/goop
```
