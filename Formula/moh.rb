# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.27.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.27.0/moh-darwin-arm64"
      sha256 "ddefa43a4687fd7b91236aefa2a69d2c8748b0f7104d4f27bf37add1e82e10e7"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.27.0/moh-darwin-x64"
      sha256 "bc7ee7994ce0055643ad597d9598ebde297bba7cbec401d270a47fdfac5a54a7"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.27.0/moh-linux-x64"
    sha256 "d97e9f0c5c02f1a5ec1d60625dce0ca674a477a6a608eccab556228716a8e7d1"
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
