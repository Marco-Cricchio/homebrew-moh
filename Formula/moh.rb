# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.11.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.11.0/moh-darwin-arm64"
      sha256 "59435a0109d9c4276122b2b1dc19df27f425ed86c315e76791860f64325e65f5"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.11.0/moh-darwin-x64"
      sha256 "785299c43d05d2ede76e75a1df3f222c1eb4ccc350eedfa1679f715a993eaae9"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.11.0/moh-linux-x64"
    sha256 "97b24c61fa4a1e4e32ee20f9c92e2f3a2a2ee1c2709e44aee02ebc8b25c039c6"
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
