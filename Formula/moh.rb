# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.42.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.42.0/moh-darwin-arm64"
      sha256 "83ce6299c15ebd699596254e603ed520cee5c0d1777233873fcfd4a75af9e89a"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.42.0/moh-darwin-x64"
      sha256 "6f6f48f6c3082dd834ed6a47209d4659cc78cbbf50a62b2af0b0524a0c3ede6b"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.42.0/moh-linux-x64"
    sha256 "fd5e55711b40641fb83112ff6a386049cc04366ed1623b242ba67d3fffc65d3f"
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
