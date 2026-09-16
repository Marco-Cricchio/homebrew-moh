# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.37.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.37.0/moh-darwin-arm64"
      sha256 "a6d2861072741b799dd745c1b76ff9f9d1c169bffa6a514a748dfc5ee6f5dd7c"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.37.0/moh-darwin-x64"
      sha256 "4bbd6f6a9a1b63b8cc8a10b7f71c1502722fd9cc617195001d525c1c62c02dda"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.37.0/moh-linux-x64"
    sha256 "6588bd3dc26f0877c778cabb87b941474264a469d76ade3f90343e0a0b381231"
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
