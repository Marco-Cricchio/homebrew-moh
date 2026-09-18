# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.39.3"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.39.3/moh-darwin-arm64"
      sha256 "a76039dcfb604a70910a3b293a90d76c5353dc1533b3c4edcf171a40d2eadc24"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.39.3/moh-darwin-x64"
      sha256 "45a6020430346c795358156ffd0586a57032a21cd516207ef74765a9f3032960"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.39.3/moh-linux-x64"
    sha256 "326133d5efdf8cba544306dd64b8dcf47e324be221acc420d38979065dd8dbd4"
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
