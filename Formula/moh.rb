# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.9.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.9.0/moh-darwin-arm64"
      sha256 "28fa730d296d59ecf6d7c4e6f50b90e544195cfc5ccf777d1b512ae2e32254a7"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.9.0/moh-darwin-x64"
      sha256 "e34a2011a61ae49656394a1a289cee77785c1fbdb346e6d85ff35e1734bcb106"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.9.0/moh-linux-x64"
    sha256 "de9e7165c79c44a6e1bd90235489926e8531740f3364702230f3abb1a8410fec"
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
