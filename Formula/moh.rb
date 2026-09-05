# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.20.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.20.1/moh-darwin-arm64"
      sha256 "02247e2a57decf7c38ce2ea839a87ee253f728fbc8b5d07560bcd3bc4b29fe7a"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.20.1/moh-darwin-x64"
      sha256 "31bc6cd6c495d14a09938473a894b3a63c70dac76ecd3e7075a74b38ef328f32"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.20.1/moh-linux-x64"
    sha256 "1bf8da61e866ceb036b417015c9a4bb9f2cdb527b798af69bae8323a38134fa7"
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
