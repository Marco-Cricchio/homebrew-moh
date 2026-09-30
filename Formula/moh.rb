# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.53.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.53.1/moh-darwin-arm64"
      sha256 "6313c056253da926dcc5fdf204ffcd9c684bdbe6da77bdae2c03a1ef1faf0e15"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.53.1/moh-darwin-x64"
      sha256 "adb4f4ebccf6a5b89781b0ecf4652e0df48f5b4371edae6574442917f672d5e2"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.53.1/moh-linux-x64"
    sha256 "4b54fab12febfee175e7ac4eeac98722ec100c1fd6eb303806cc40407cce396c"
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
