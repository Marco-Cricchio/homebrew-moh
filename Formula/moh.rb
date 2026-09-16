# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.35.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.35.1/moh-darwin-arm64"
      sha256 "518771da7d7f4a2d2b4cc45129c7e9befae006500d824c7256b57f691b237fc9"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.35.1/moh-darwin-x64"
      sha256 "9a1305c59f5672f795c2e5e07ec75352dc58885d2cec2c1004b74bbec65d8520"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.35.1/moh-linux-x64"
    sha256 "053c405bb22e69bfdec1cb95b1e7eca793e7b8c8c6281de01548b7bacf534664"
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
