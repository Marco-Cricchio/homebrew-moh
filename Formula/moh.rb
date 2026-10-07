# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.59.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.59.0/moh-darwin-arm64"
      sha256 "321c640358e363a90debbb5e075c5c7f782db2794d532f3e977776dd27b3dcb8"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.59.0/moh-darwin-x64"
      sha256 "89b8903268c22bdc488a83c7f3cc98f5fb4d53e1be01e8c71bb89449900eddd5"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.59.0/moh-linux-x64"
    sha256 "7a5584249f8bda8b10697fbb8a482bfd98b749f7d57beb6f60f4d94a3f5cf816"
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
