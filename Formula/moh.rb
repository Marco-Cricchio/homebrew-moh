# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.61.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.61.2/moh-darwin-arm64"
      sha256 "8dba60b285f5e3afbae96fcdf75612d9a55f12cb24b45502dd5de2d8ad4c4947"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.61.2/moh-darwin-x64"
      sha256 "5c79b53b2531e327a2986f4ffccc20e8f9c5a064c68ceafe06392360afc5f5b7"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.61.2/moh-linux-x64"
    sha256 "e9e83f6168b4aa5c829d3000eafd798221b6721e325575535e5d325baa04c0ae"
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
