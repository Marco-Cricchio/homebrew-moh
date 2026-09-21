# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.43.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.43.0/moh-darwin-arm64"
      sha256 "f1d294c04c74d8eafc349bbda8ed70035effed4145282a110a13204f9ef3d6af"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.43.0/moh-darwin-x64"
      sha256 "346c991cab6f23200f04ca80df416d933656e1708d04e463ce8bdcd8febcbc97"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.43.0/moh-linux-x64"
    sha256 "b99096a94dca0b2b6d2897daded91e6eeaf946ae0e8213dfe7c9528d94cf4c82"
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
