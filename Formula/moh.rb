# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.65.4"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.4/moh-darwin-arm64"
      sha256 "984f28495128a44899a23e83b9180c38fd1be2d09162156c1c9f67c64bd4622a"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.4/moh-darwin-x64"
      sha256 "51c734896d7429db36696d0fe8a8133c35f47e219f4dd400d715852964d2e6d3"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.4/moh-linux-x64"
    sha256 "f4fe002d62a6ae3d418bc433816589144baa642370278bc7eb608cefc679fb72"
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
