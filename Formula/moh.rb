# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.32.3"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.32.3/moh-darwin-arm64"
      sha256 "902649fd68b84ff85aa6bcdb774ad0d9feba85bb32afc6b49a6ea354356bb585"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.32.3/moh-darwin-x64"
      sha256 "63469be8ad71ae795cb659f889a7b66a2734d5e71eacbcf03263ae00404038a1"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.32.3/moh-linux-x64"
    sha256 "ae2f48f127aa007931794b4f600481d37098efe052c2e6ee452df001e36582d8"
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
