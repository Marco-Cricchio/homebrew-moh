# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.64.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.0/moh-darwin-arm64"
      sha256 "024ec9624e1cf4f9d25ba4824dcf90fe3ad7c5b42316ccc8be71715375e68fd1"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.0/moh-darwin-x64"
      sha256 "67b1796b8ff5b5315c4a887869e47f934817f6e789a1e5d250fa053cd800c262"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.0/moh-linux-x64"
    sha256 "213cf74d04b61176db092d2b7ac4e8673e351cec65d28c92285667e0d2a2c7cf"
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
