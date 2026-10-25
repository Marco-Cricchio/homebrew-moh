# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.66.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.66.0/moh-darwin-arm64"
      sha256 "952654024faae3ebeab77716399a43cd2d6ab0eb0c76e1b08823c41c6a4ea4a0"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.66.0/moh-darwin-x64"
      sha256 "102edc995cd623bb4a587fdd2acb8503ed382af9159f3065c5512ea52645ece5"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.66.0/moh-linux-x64"
    sha256 "cb457666dce252f3b025e404a66cdb4bb79b609051d6f725bc991cd8a1b0be68"
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
