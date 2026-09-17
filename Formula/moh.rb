# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.38.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.38.1/moh-darwin-arm64"
      sha256 "cc83066ca0b05af4f5b68ca1be54e0d83a0a46c84ecf036b0b6db9d32ca4ff3d"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.38.1/moh-darwin-x64"
      sha256 "94c9018525c7905a682f94a5ff649e58fb3285fd0a38d3c60474881d64f3a494"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.38.1/moh-linux-x64"
    sha256 "d4d4130d9bc0ffb997ad54f2b00aece32ea08d1b0e6c66d426e9d30b2815857a"
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
