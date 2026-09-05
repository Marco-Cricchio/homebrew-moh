# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.21.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.21.0/moh-darwin-arm64"
      sha256 "0268fa1b83797160475866d101e85e4b6f97622d1c8ec70d879ba3fe26a9b126"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.21.0/moh-darwin-x64"
      sha256 "61414931cdf104997d5eb5573b6b760f4850a1808b3adcb0535a4ec00c493581"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.21.0/moh-linux-x64"
    sha256 "0d1a6a165f083c16fb0140a4e2a24f9c04ea5ee18eecacd89166e1e301f1d274"
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
