# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.65.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.0/moh-darwin-arm64"
      sha256 "9142712f2bad30b9db9a65ac7d7d7c2591fccd683390670e756092cc4d15b596"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.0/moh-darwin-x64"
      sha256 "f10b6a91ef325f32bf9f01cb18961f6c37e0466b079772e4da2548cf559dfd13"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.0/moh-linux-x64"
    sha256 "eeaa2050549fd42ef27fa854c135db7b3a56938731dd11ead16c0a3d78f681b3"
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
