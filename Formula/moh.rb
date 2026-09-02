# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.13.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.13.1/moh-darwin-arm64"
      sha256 "466f4fcb62a69743508688efb8c90fe62c2d6350b78a795f2f34039f19f3bf3b"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.13.1/moh-darwin-x64"
      sha256 "a7ff53ab9bc5c03e4212ef502f5a5aeef39db247ed9a1761aae285ba51241c4f"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.13.1/moh-linux-x64"
    sha256 "a7ef1a9a8701748bd26e19de045a070100101dd262a3327b90f38136843eba63"
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
