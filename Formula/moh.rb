# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.30.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.30.0/moh-darwin-arm64"
      sha256 "a1baa7f56c9aca6713f0523e090966a52ab0a2ba35bba13624fa0dc9df13321c"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.30.0/moh-darwin-x64"
      sha256 "a0c9ecda33828bc8080047015d8c91d6b70331c8c38ae038a0186b3dea3c5d13"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.30.0/moh-linux-x64"
    sha256 "9dd03172b24cd443bbfb8f5d7242957a3ec36763198b7a7987a394ba03875aa2"
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
