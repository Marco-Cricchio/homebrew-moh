# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.65.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.1/moh-darwin-arm64"
      sha256 "5e243120dd3701ae857ab5e11b92759f631c78567be60333bd78f99e5afc1786"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.1/moh-darwin-x64"
      sha256 "26613681c1b3be4dd5ae40dedf9ad50b68e1420345817fcc9b502a670e828c15"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.1/moh-linux-x64"
    sha256 "580e22084a4776293abfab2a4d823cccac03baa6e56664b00d73c0be6566dc8d"
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
