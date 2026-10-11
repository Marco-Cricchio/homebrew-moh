# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.64.3"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.3/moh-darwin-arm64"
      sha256 "e704545135f48b523ff27bdf52c0b0edb2bb98ef63785dcc906fed99a7b3dca5"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.3/moh-darwin-x64"
      sha256 "dc1b444f27040e69f4296e9c26a78d585bca7e454968679804dbe7c3a1116960"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.3/moh-linux-x64"
    sha256 "6116451d79d01d1c8a0b1c01f854a4f6ef8ece8944235e72ad5ab271284767bb"
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
