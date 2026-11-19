# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.69.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.69.0/moh-darwin-arm64"
      sha256 "2c2d97725980fb8d7d04c494778e78e602779c4602d9264ceeb425ae5d964462"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.69.0/moh-darwin-x64"
      sha256 "9cc09680cf198e31aefcd89bd59e8f62fcce921e5858ef386aeb12802625ed98"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.69.0/moh-linux-x64"
    sha256 "7e67435676959dfa94ba538d23671564db29c0b628ed4160a39423753e3f5b69"
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
