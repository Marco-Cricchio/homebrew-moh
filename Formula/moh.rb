# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.58.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.58.1/moh-darwin-arm64"
      sha256 "b4f9f80b9ac1a5c6e01e624bd56f6b775e950432d32965d545bc063243997206"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.58.1/moh-darwin-x64"
      sha256 "4532c721d6b1e10cd19b16bf7919cee7ea8c509a5fd92ff01307ba8039c75f71"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.58.1/moh-linux-x64"
    sha256 "0c8b2216c69b0b866634f1d43649ebd3d615c1ece85f891f037ec085a21bca41"
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
