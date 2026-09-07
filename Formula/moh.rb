# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.25.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.25.1/moh-darwin-arm64"
      sha256 "11900ad20323c8d21fd30c48df8b65b8202975156ffa456fc6caf28fe22ddf42"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.25.1/moh-darwin-x64"
      sha256 "5421dabf0b1606de04d45e144a83f63dc8dd06412f9cc3fb0bc92558efa9e498"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.25.1/moh-linux-x64"
    sha256 "21fd1975565b96e716007ab968fbaeb13f094d98ec1c5a8aecdaea51afc2f680"
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
