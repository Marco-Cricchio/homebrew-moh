# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.62.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.62.0/moh-darwin-arm64"
      sha256 "cd8da527048976c677154d66b9c6f5d829004d762c36fedb448398a1d45d2190"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.62.0/moh-darwin-x64"
      sha256 "139dbba3f8a22a008db231bde380611314efb6e96f7718c668176af5d71bc6cf"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.62.0/moh-linux-x64"
    sha256 "2cff2588779a029bb656e48ca604e49e2f76d918168ed7d897a168b02f4451e8"
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
