# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.40.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.40.0/moh-darwin-arm64"
      sha256 "e86b7a07a0cc4404d038a78dbaea12ab2f2478a73a98d0cefe1aa8c5c9c25b1a"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.40.0/moh-darwin-x64"
      sha256 "0032c41256a892b92d296108c77cf681adfa91211958de0c9714d46f33eba5f7"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.40.0/moh-linux-x64"
    sha256 "8d557df7f93089ddf5aad1ddcd6025f4ca162504e1edc5fe4aa53b3957e8598f"
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
