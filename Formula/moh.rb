# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.33.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.33.0/moh-darwin-arm64"
      sha256 "8dcf02502eec3324b8b97a814dd7637a656b1da138149b997960ccd5e5c875ad"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.33.0/moh-darwin-x64"
      sha256 "d82b754f3b93a7a6aaea3e4e8e71479f6d677cdfe4113f61e37875ed0ec99cec"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.33.0/moh-linux-x64"
    sha256 "edec9706b04bd760379d58228d1d76bd53d8f61347305885d2c9feddf829e5c1"
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
