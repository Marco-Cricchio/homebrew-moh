# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.64.7"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.7/moh-darwin-arm64"
      sha256 "6aef25249ebe23a7805f64504865db09f05a7053fc99de5193713bfad170db3f"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.7/moh-darwin-x64"
      sha256 "23c042f707acf4e3512a05f7b8b608b802e7c7eca21820e7cc6e61a323ba826c"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.7/moh-linux-x64"
    sha256 "f9709da808a8765d88129bc66ae7e215e5069ba42f57d7b9cec0442893e1bba4"
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
