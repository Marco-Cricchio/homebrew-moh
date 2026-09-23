# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.47.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.47.0/moh-darwin-arm64"
      sha256 "ae010a12068c40443a0dafbfd5b2c649476297dd586542fb8b7bf318b7875577"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.47.0/moh-darwin-x64"
      sha256 "3d1cfe0d495bb30e3a1e7a51d1e9c326b8555fd9344974f3fc55a776e45f71ee"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.47.0/moh-linux-x64"
    sha256 "87654a9c305c5f5058d4966b147945e265c1500507f20f735b0f7bf3524b2dd9"
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
