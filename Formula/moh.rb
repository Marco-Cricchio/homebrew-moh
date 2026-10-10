# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.61.3"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.61.3/moh-darwin-arm64"
      sha256 "fae33566722770610b4f1a76b05515df031b8bd6a6d112f923155ff59cc0c982"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.61.3/moh-darwin-x64"
      sha256 "aae2578b3f783fb7c5b108bf6b72efb92cf5b75ed027efdd3aca147ae0a155ca"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.61.3/moh-linux-x64"
    sha256 "bd9256708c91fd382594a2a563429ec39a4f36a48d5a27e3d99b4d8d89868620"
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
