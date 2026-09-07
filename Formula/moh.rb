# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.25.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.25.0/moh-darwin-arm64"
      sha256 "7bc19820755b14842b5c6388b580c77c44dbb18eb215f944e0926c3b6c149143"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.25.0/moh-darwin-x64"
      sha256 "e6950f0707c942c07b9c3d927362239b3f847d4bd94c403ce10496bbc630c097"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.25.0/moh-linux-x64"
    sha256 "da931839122112f3790888a38ff21d70bf7dc392d30e8bad0cac2a0a6f3e6552"
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
