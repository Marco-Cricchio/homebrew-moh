# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.22.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.22.0/moh-darwin-arm64"
      sha256 "0ba5f2da6f3c60998c0ed5f2b454dfb7871323bf7e45229a37b5ad27ec42ddce"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.22.0/moh-darwin-x64"
      sha256 "e8e23099ea2c4dcb2860d9e98ac1366f29ef9e41197773e3486be1d2aa8fa609"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.22.0/moh-linux-x64"
    sha256 "6db381eadceee240dc1cb1799b8c2644b17f9911ced66281bffb798a3a05bf49"
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
