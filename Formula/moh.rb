# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.57.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.57.0/moh-darwin-arm64"
      sha256 "ef06856027ddbf583a3f29e11f02543901a2422b843f5f948e8f9c83889a980f"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.57.0/moh-darwin-x64"
      sha256 "2b7c33c1b38141d54d5d960908125d05d19c465a3aabc3012595fef95a14f661"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.57.0/moh-linux-x64"
    sha256 "fbeea2132a16ea59430b72a7e886d3cc14b2275cd087f7e3c047752dc4d7075d"
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
