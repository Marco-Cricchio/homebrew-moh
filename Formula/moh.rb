# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.54.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.54.0/moh-darwin-arm64"
      sha256 "8f1ee7a194018514a34054c70d71b26db10315a54c616225aa04f1f58a6fda63"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.54.0/moh-darwin-x64"
      sha256 "5592987d0109283c565978d18be99233583ce0223cd074c356c761c311810b44"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.54.0/moh-linux-x64"
    sha256 "f91ab4eaf98b5becc6e9ec4db20a4602ab75102e13be20456e190fed66294de7"
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
