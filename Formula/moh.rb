# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.6.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.6.0/moh-darwin-arm64"
      sha256 "9201a87aef61faaab120b1fe716c5d1454224e2e89dd776962b1b4a1ba04dc64"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.6.0/moh-darwin-x64"
      sha256 "d12c212fdd2caa18c2eb07658bd4e1f531b9221cb04bc368c2cdb053a18588d2"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.6.0/moh-linux-x64"
    sha256 "33a04df58130703c4f1b9ce06356e3bd431e5ba5554d723431297972c7c3e09d"
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
