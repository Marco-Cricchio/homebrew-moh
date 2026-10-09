# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.61.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.61.0/moh-darwin-arm64"
      sha256 "5f496539dfe78a13e0c5924b6149b0526cb2432e7f9e1a0156453cd95c2ec996"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.61.0/moh-darwin-x64"
      sha256 "3ef3971c7d777b4ccbedebeb8c3799797d3d6fea0af74aba3a1ba025a5ef1270"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.61.0/moh-linux-x64"
    sha256 "db5ed5331c986de954650992d28ead461ce0caa143d50de57404786680570c30"
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
