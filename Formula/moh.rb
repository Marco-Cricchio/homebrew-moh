# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.60.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.60.0/moh-darwin-arm64"
      sha256 "6d7ea1a097158981d30fd9ff57253e1a514935e3d561e7b2a8f8a60784c90b44"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.60.0/moh-darwin-x64"
      sha256 "abc30b25b7d915760118eeba1af03e50414189dbb028c98d09279799d88730fa"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.60.0/moh-linux-x64"
    sha256 "ed99a60c6cb7316ee26adea914a03b5a19707a1f860f4c6bfb205b7b0e6907c6"
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
