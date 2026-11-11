# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.66.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.66.2/moh-darwin-arm64"
      sha256 "0bd5edd8492c9b7b4be0f0d10bfb025ab27fc36d9b41b9c575e2e21cd1fb2cc2"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.66.2/moh-darwin-x64"
      sha256 "5d69ef2e08887f4b044667185a160b83f88d997d33f76bd4076e5a5c5e1dd74d"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.66.2/moh-linux-x64"
    sha256 "2cddd2557d8b3d1440b742cb3fa87b675d1aadbf25f49b7fd3148251cbe19c61"
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
