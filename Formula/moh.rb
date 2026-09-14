# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.34.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.34.2/moh-darwin-arm64"
      sha256 "a8cc85681114920d2d2db02a8c5f000672e9d14c725141c19142a4a34c7ed72f"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.34.2/moh-darwin-x64"
      sha256 "406b2e57de9da1c5d9862263b0646a65168f3c5dea30e59c3f103cab919f8b90"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.34.2/moh-linux-x64"
    sha256 "1f52a4ff06842c4bc84401e88a2e053ab5bb705e9fd1f4744819b3ec6ddf828d"
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
