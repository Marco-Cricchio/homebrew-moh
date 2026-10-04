# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.57.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.57.1/moh-darwin-arm64"
      sha256 "e0ca0b5669d4388a5dab921bdf3e8bee6d3fb5b01766fd825e4ed0b3839822c8"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.57.1/moh-darwin-x64"
      sha256 "24a0bf68392aa2f8850ed7c3e5d3fde641f636fc4b6a9e88610ab3b154bbd04c"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.57.1/moh-linux-x64"
    sha256 "2e7d79bdb7255325d2ce0e0be2244b49278b16154698f95fc8833e8ff9f7069c"
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
