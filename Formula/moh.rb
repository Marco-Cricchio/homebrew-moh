# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.61.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.61.1/moh-darwin-arm64"
      sha256 "9bad62a155ba06173e2c48f9b96ca11c4c7d04325609d0336650e8b19506f147"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.61.1/moh-darwin-x64"
      sha256 "59d390d0e1a464abc7a662052835cd7551fcda7895dd11171ac717d53a8203b8"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.61.1/moh-linux-x64"
    sha256 "cd84531d290787dda730690ceefdc0b14125c27f738f10b237e9bded3fc94635"
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
