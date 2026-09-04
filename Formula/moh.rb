# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.17.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.17.2/moh-darwin-arm64"
      sha256 "e2801eb0e86e31cef89401998c1429cd37290e1eb7a0e1f9a6c401defb20fabb"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.17.2/moh-darwin-x64"
      sha256 "be363c8aac3df03276902196485147966d5e9d38050adca3485688f183d1d96e"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.17.2/moh-linux-x64"
    sha256 "b21ca624bfb41c81af481af484404270561a4b688197d88e5def3be919ad588b"
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
