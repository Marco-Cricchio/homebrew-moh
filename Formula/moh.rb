# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.45.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.45.1/moh-darwin-arm64"
      sha256 "27b46e9a09766afce1454c262475b71ff9dd1b3bd52bd02495cbb05520980844"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.45.1/moh-darwin-x64"
      sha256 "8eeb14c0b34521e52635bb04ed565f3f5c549fd33d84f562c1f8f77da2cd1925"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.45.1/moh-linux-x64"
    sha256 "a742e6fb44feab20e1efc7de0dea32e49bb244894be5333ce16486a783925df9"
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
