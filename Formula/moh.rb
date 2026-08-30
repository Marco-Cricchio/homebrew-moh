# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.7.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.7.1/moh-darwin-arm64"
      sha256 "8cefebf6804e6447135bcbbd7a4a9bb75b31aea7698b0adb9c9a5f919b9af2c4"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.7.1/moh-darwin-x64"
      sha256 "7485ea3087f3f241d9a311eb5cef15b673fc417033f9438f1e0445ce03c990b0"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.7.1/moh-linux-x64"
    sha256 "7c9512dad0466deb4207d778441853eae94e317cf7ac40459e2961349fc757f1"
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
