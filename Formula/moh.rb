# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.11.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.11.2/moh-darwin-arm64"
      sha256 "0fbd5e0710d8b16242589deea3a2b99884fc138238b010a0063dc291cf2217ec"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.11.2/moh-darwin-x64"
      sha256 "4dd065588ff969cf4ae7897124c84a7bf48fb400aa7f25031f80d81cb65cee41"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.11.2/moh-linux-x64"
    sha256 "23653f4d42f64afccf8d67cbab343259c554fb809d67ddc346b6cf31cc4f0032"
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
