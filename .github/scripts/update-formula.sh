#!/usr/bin/env bash
# Regenerates Formula/moh.rb from the latest (non-draft) release of
# Marco-Cricchio/moh. Assets are verified against the release checksums.txt
# before their hashes are baked into the formula.
set -euo pipefail

UPSTREAM="Marco-Cricchio/moh"
cd "$(dirname "$0")/../../.."

tag="$(gh api "repos/${UPSTREAM}/releases/latest" --jq .tag_name)"
version="${tag#v}"
echo "latest release: ${tag} (version ${version})"

if grep -q "version \"${version}\"" Formula/moh.rb 2>/dev/null; then
  echo "formula already at ${version}; nothing to do"
  exit 0
fi

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
gh release download "$tag" --repo "$UPSTREAM" --dir "$work" --clobber

# Trust but verify: the checksums file is produced by the moh release CI.
(cd "$work" && sha256sum -c checksums.txt)

hash() { (cd "$work" && sha256sum "moh-$1" | cut -d' ' -f1); }
arm64="$(hash darwin-arm64)"
x64="$(hash darwin-x64)"
linux="$(hash linux-x64)"

asset_url="https://github.com/${UPSTREAM}/releases/download/${tag}"

mkdir -p Formula
cat > Formula/moh.rb <<EOF
# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/${UPSTREAM}"
  version "${version}"
  license "MIT"
  on_macos do
    on_arm do
      url "${asset_url}/moh-darwin-arm64"
      sha256 "${arm64}"
    end
    on_intel do
      url "${asset_url}/moh-darwin-x64"
      sha256 "${x64}"
    end
  end
  on_linux do
    url "${asset_url}/moh-linux-x64"
    sha256 "${linux}"
  end

  def install
    # The release asset is a self-contained Bun-compiled binary, not an
    # archive; the downloaded file name varies per platform.
    bin.install File.basename(stable.url) => "moh"
  end

  def caveats
    <<~EOS
      moh stores its state in ~/.moh (config, auth, skills) — created on
      first run. Run `moh --help` to get started.
    EOS
  end

  def test
    assert_match version.to_s, shell_output("#{bin}/moh --version")
  end
end
EOF

cat Formula/moh.rb
