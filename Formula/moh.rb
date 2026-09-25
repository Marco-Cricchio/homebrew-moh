# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.50.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.50.2/moh-darwin-arm64"
      sha256 "26078410b5c99595eefd76a4fcfe75e783bd219793132e83de0e48818c9167ea"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.50.2/moh-darwin-x64"
      sha256 "1dc07a6be9bbe650629f64cfa058c8c4874c58297e441c460fd9c90f58ba3eea"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.50.2/moh-linux-x64"
    sha256 "735d2f14ef37a033f5c7105fd0763cf55cf60ad0a25b3d1a877c57e2bca9359d"
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
