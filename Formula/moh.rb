# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.39.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.39.2/moh-darwin-arm64"
      sha256 "2067448c172ccaa1a68fb6b3d17e16ea7acb9c1e56b392ac61235266518595d2"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.39.2/moh-darwin-x64"
      sha256 "1055c8298f1f1cdc0d4d3c404e4f2bba2f190fe351564ed8f1a17a9b6719180a"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.39.2/moh-linux-x64"
    sha256 "cfe7e61b12012a9c6b1260662f1234f0b5e1833c139b68749de042992ae75de0"
  end

  def install
    # The release asset is a self-contained Bun-compiled binary, not an
    # archive; the downloaded file name varies per platform.
    bin.install File.basename(stable.url) => "moh"
  end

  def caveats
    <<~EOS
      moh stores its state in ~/.moh (config, auth, skills) — created on
      first run. Run  to get started.
    EOS
  end

  def test
    assert_match version.to_s, shell_output("#{bin}/moh --version")
  end
end
