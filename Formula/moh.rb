# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.59.3"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.59.3/moh-darwin-arm64"
      sha256 "3c66493f1cb5ebcf9bb5a7c73cbe410c1e19566f62d13dbd2d8a8ab594ef09a2"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.59.3/moh-darwin-x64"
      sha256 "e1452ccca4153da6a92266bc95900822bdfca7d38ef860056bffa4f65a4fd459"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.59.3/moh-linux-x64"
    sha256 "6f5021a6430cfee222adb03f4b9478723e0712a384dba8b517c6fa7dafeb350c"
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
