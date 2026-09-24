# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.50.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.50.0/moh-darwin-arm64"
      sha256 "eef09c646cc75c4e4069d20940210bbd449af63c7a07577c397ba5b43739d476"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.50.0/moh-darwin-x64"
      sha256 "0055197e1ab4c0a2128e86feaa351c3868ba576ca5d33feecd6937bd43b6ee26"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.50.0/moh-linux-x64"
    sha256 "03049f8e76c9741de1830c2e378e3ffa55532f9e3e5d8f0b2338c4f5c1a78ced"
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
