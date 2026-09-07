# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.24.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.24.1/moh-darwin-arm64"
      sha256 "7c55aeb0649acf11f09f2835a9618973c80811c876563cea5d891f402b9c6b8b"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.24.1/moh-darwin-x64"
      sha256 "ef91280b05ae8a951af6bd3c7b617b69afc9514cee5ceb72591079d1084f5fbb"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.24.1/moh-linux-x64"
    sha256 "cdd9c27099df158347098b3a9deab866ad8e977ce995b8c1741f4785828c5002"
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
