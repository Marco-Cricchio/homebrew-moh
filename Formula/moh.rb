# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.20.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.20.0/moh-darwin-arm64"
      sha256 "1bd945b59169b4f6fec43f9d113ca77c98994a85b621efd34386d1a39b5877df"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.20.0/moh-darwin-x64"
      sha256 "21b9a1568489233a9e6492c5eab66e0a9dfd0bc2c474dabdf9350cb58ec95824"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.20.0/moh-linux-x64"
    sha256 "cd1e1269f417e1aa71360d0a3a8ee138a01eced25a1d31674ef9909d44470953"
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
