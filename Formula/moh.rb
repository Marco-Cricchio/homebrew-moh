# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.50.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.50.1/moh-darwin-arm64"
      sha256 "a40f912aa5eb6a139a8cf5eb1e4e009b67cfe14ed38b5f19b368764b4e4f606b"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.50.1/moh-darwin-x64"
      sha256 "af7f0bc5f2edf064c15e595a7ded699fe4d1ed285b429456306a4806cdb2dafc"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.50.1/moh-linux-x64"
    sha256 "a8e420866bee027ad31491627821cf6e2aa972dd4ff5195a0964446c6bd4f4b8"
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
