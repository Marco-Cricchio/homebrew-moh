# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.64.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.1/moh-darwin-arm64"
      sha256 "4529aeb0de51f0c22508144f8d8ccc8f23d807e267756e8a223191aa44175de7"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.1/moh-darwin-x64"
      sha256 "820d14be0e3944db388d72ba6edf02c8a5c8b98357f9733310e033db2c149be6"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.1/moh-linux-x64"
    sha256 "d32fd3c27ecf9f52931d3bd91a48abb92da5b3be23baf70716b47b9d1c21e15f"
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
