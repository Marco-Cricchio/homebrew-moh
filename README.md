# homebrew-moh

Homebrew tap for [moh](https://github.com/Marco-Cricchio/moh) — a
provider-agnostic, headless-first coding agent in TypeScript on Bun.

## Install

```sh
brew tap Marco-Cricchio/moh
brew install moh
```

or directly:

```sh
brew install Marco-Cricchio/moh/moh
```

The formula installs the self-contained release binary (Bun runtime embedded)
for macOS arm64/x64 and Linux x64, checksummed against the release's
`checksums.txt`.

## Formula updates

`Formula/moh.rb` is generated and committed by
[`.github/workflows/update-tap.yml`](.github/workflows/update-tap.yml), which
runs daily (and on demand) and picks up the latest stable release of
moh — drafts are never picked up. Publishing a release in the upstream repo is
all that's needed; the tap follows within a day, or immediately via a manual
workflow dispatch.
