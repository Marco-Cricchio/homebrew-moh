# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.15.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.15.0/moh-darwin-arm64"
      sha256 "35a7068e0148e5468fff24d769a3011f99e4d2541e31d9a77a2397652f3318e9"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.15.0/moh-darwin-x64"
      sha256 "96ce0b0e55ae369637a28311742dc266768d36bb24685f28dd0538a089141cd5"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.15.0/moh-linux-x64"
    sha256 "5b785d345a55ccc48abd490807b9361b187d1162eee97eb909a366f691719a0f"
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
