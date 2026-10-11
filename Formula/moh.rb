# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.63.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.63.0/moh-darwin-arm64"
      sha256 "f2daf33f450df6e8545c555f3bb061d3f43c62028d00e133a11b20eae2883fd5"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.63.0/moh-darwin-x64"
      sha256 "f114dd2d456951a8a05ef9cb5179126a078337315f680a3dbbf4c011291681a5"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.63.0/moh-linux-x64"
    sha256 "01334b107185bcbf1eb8cf8d6ee459f39892f125d24ba81096c0994bb9457387"
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
