# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.11.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.11.1/moh-darwin-arm64"
      sha256 "bd8ad03612978030c5a49cdaa2e5221ca57f14d1c2428f7042fd9794db6b79aa"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.11.1/moh-darwin-x64"
      sha256 "84961294de93a5e21f0b6ad6babff705477f22964254b23dae2486d155862e1a"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.11.1/moh-linux-x64"
    sha256 "fe7a5f773576e9948bf9428b4971cb47db1558ef39b404fb5dbc1d3cee8a9137"
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
