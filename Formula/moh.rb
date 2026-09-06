# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.23.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.23.2/moh-darwin-arm64"
      sha256 "0d4da14f690eb513355e730a420baaa011211fe0bbaafbfe359b4deedf34cd58"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.23.2/moh-darwin-x64"
      sha256 "e4ba3e58fcc111cfb49af0c6bbbcdebf26f93300fcc68528cd669c0d66d2fd46"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.23.2/moh-linux-x64"
    sha256 "ec19edb28c7dfc4d0cab8e3d83f4099fcdd664368170520b44cb27649bfb4f62"
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
