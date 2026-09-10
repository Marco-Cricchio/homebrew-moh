# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.28.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.28.0/moh-darwin-arm64"
      sha256 "ff6bfcb55ec8b71a80cfb17622672b0fa963b6e553c35968b64358672c78cab1"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.28.0/moh-darwin-x64"
      sha256 "693ef62b77c54c45c1d0f640b9ec1ec9e32159a35034c90f2d06515d3134db71"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.28.0/moh-linux-x64"
    sha256 "56eb9f3bd6377724c1f90dac726a243ea804da86d68e13de7bab1a628cc0e2b6"
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
