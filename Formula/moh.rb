# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.66.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.66.1/moh-darwin-arm64"
      sha256 "586ed2cad17df5f0b87661d1695e061a13a12d271371d90ddaf83b0831935aa0"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.66.1/moh-darwin-x64"
      sha256 "14560484e90b520b2ca1f2d368b2cae73e1e6e0d14277751d04ba6edec2c931d"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.66.1/moh-linux-x64"
    sha256 "f1da5a0e24daaa4d9bdfbe1a2f16557a0e0ca0bb873f4a117360a3259afc4cce"
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
