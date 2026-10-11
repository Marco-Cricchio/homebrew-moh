# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.64.6"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.6/moh-darwin-arm64"
      sha256 "140d8ce6b963443e469c14f6fb86667b3fe817010e41d251fbfe884a1908908b"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.6/moh-darwin-x64"
      sha256 "b8e74caa364ec6a5bdbb0064c0d93eea4fbaa598870ff2d2525d19902c70e2ec"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.6/moh-linux-x64"
    sha256 "3f4777ee55dca55933da2aeed9936d10041299a505359428ba4e21914a51b533"
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
