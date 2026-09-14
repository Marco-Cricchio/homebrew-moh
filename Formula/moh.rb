# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.34.3"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.34.3/moh-darwin-arm64"
      sha256 "43aacd0b7ada65fba80c8d5a304136a4f082152f21fee43ecdaf7e846ae6ecab"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.34.3/moh-darwin-x64"
      sha256 "d008ecb572bbd8c50c3d50feb89079182346c9b0af7f3024aed6fe5d6f7dc7cb"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.34.3/moh-linux-x64"
    sha256 "4cff655b5b2e8c5b6d8fb98cce45cc2063e75a85b8e7708fa8f2b5043d5fd74b"
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
