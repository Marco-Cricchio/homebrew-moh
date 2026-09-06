# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.23.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.23.0/moh-darwin-arm64"
      sha256 "cb8f49fba9f089b4d7fe0ff766a5a699d7fa5af6fd3acb09f1d1906375e3457b"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.23.0/moh-darwin-x64"
      sha256 "6021ce5aacb06d2df63ec69b72c0cd332a6c8e83aa9cc8a8d6027dd7b90dc0ca"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.23.0/moh-linux-x64"
    sha256 "3334a0f1b573a1735c25d88279ec184b434ecadc5c601427217f980de43b2f09"
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
