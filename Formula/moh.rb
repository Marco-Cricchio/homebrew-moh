# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.51.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.51.1/moh-darwin-arm64"
      sha256 "ed9112409ebf8603b12c4b06e276d860d186aa747e591da1c980cb0401013872"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.51.1/moh-darwin-x64"
      sha256 "2f456e7cd39245eb21aaef4812d1addf8a2dd212fce7b35e15407238b2a826bc"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.51.1/moh-linux-x64"
    sha256 "94b48dc4cff005d1b69bcd17183779db3040debbfce7743aeed4f5695f6fe0ea"
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
