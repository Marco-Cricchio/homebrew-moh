# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.67.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.67.1/moh-darwin-arm64"
      sha256 "ee84ac000fb6540ff0319fb9eb4f288b969cbbcbc497ce0452a7c19d063f290e"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.67.1/moh-darwin-x64"
      sha256 "23a5ba1ff72271cbfe8b46ee24617c2f0fbe156bb179d8b74beafea71b4e16f4"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.67.1/moh-linux-x64"
    sha256 "d9e146a3d8b7608b55df96ee1197d86f214a267ef02aefff2c78c28b7651020e"
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
