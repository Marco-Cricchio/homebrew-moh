# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.36.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.36.0/moh-darwin-arm64"
      sha256 "dfaf4ac877543f57710dd698dd9489bcb301586e310e182cf90d4b377f495d1a"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.36.0/moh-darwin-x64"
      sha256 "034bb195542a72be881a3626f8849f689126475231b5d83c90d0b1d75aca27e3"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.36.0/moh-linux-x64"
    sha256 "05a4eaa96487b2ac82565d2dcb1b2261742c28ecbf22fdebcbaa7f8aae357442"
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
