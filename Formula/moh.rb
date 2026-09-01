# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.12.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.12.0/moh-darwin-arm64"
      sha256 "ae519f4402116477440b1baefd453ce4387ea1c2925a4ef0d452e212173efcd7"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.12.0/moh-darwin-x64"
      sha256 "0cb3a13a6c2513bf039d8bdd0fd4e7d678add84d78ab4dad4e03eea059c1d48f"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.12.0/moh-linux-x64"
    sha256 "060024d915456255aab05f8b53460ccb9fdd3d49101ce133fb6ab6f1ed394d1e"
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
