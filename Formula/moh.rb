# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.48.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.48.0/moh-darwin-arm64"
      sha256 "81b7ff5e3b610730c2bf2e0b4bd26c7f88ffc7755e6c245fb807777b90a37f8d"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.48.0/moh-darwin-x64"
      sha256 "9539944679cead26564b9c4969545f39fc05608b3788f3bb364cea7e659cb11a"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.48.0/moh-linux-x64"
    sha256 "d8e4de668f6906fefb9d3bbf35350ab8d489d290151d00b752c387a8445c7101"
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
