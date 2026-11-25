# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.69.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.69.1/moh-darwin-arm64"
      sha256 "8cd70ca48b33f31cfe778566df771ec6b498479cc5d846bbaa1318287a605809"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.69.1/moh-darwin-x64"
      sha256 "40e52c682b425bf29905aae4999936f6bdf5875b570fbd7053cbbc73aa169967"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.69.1/moh-linux-x64"
    sha256 "41819d481f20e8497c5f9a57fabbd45f4b0198aeea5e093f8aca20c7f97e2c60"
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
