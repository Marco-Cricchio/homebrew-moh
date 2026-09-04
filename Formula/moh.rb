# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.18.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.18.0/moh-darwin-arm64"
      sha256 "ccce6b73efef2d8fb695d4b757008920f55fc5be8a3d2aae52b4b515c3e5bb41"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.18.0/moh-darwin-x64"
      sha256 "77c8e5a2ebde8c2078db37a4dfdd540f41c3a6ba4bffc65a12825893945c15ba"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.18.0/moh-linux-x64"
    sha256 "1bf223943939fee95006664410d91cf85f3b640f514c3165a040567feb62161e"
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
