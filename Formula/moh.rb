# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.17.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.17.0/moh-darwin-arm64"
      sha256 "3347f41f2c217fce23e535560df16e3cce3adcdb6cb387e5267247a16acb26ce"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.17.0/moh-darwin-x64"
      sha256 "b2b43cddd67be7085b9f9e1b96fc8c828c08ed9b26a98ae8ec250d27cefcee1d"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.17.0/moh-linux-x64"
    sha256 "389341e62f22e6d2f9f62a0cae3f76837955f4f10247f2c8f3fad5210bd9fac3"
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
