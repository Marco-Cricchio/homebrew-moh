# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.38.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.38.0/moh-darwin-arm64"
      sha256 "27cfbbaa9a6777fdda3376418584ffc2c0f692ca938d7b704da579a3b2e36a17"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.38.0/moh-darwin-x64"
      sha256 "4e3d8ae252abd1dfc48650d326fb4f41186efa303894d6a0503c949ca64d88ee"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.38.0/moh-linux-x64"
    sha256 "e50f01a05e0a93e22b9e41626a684ac73d63c04586951d0439f9f5d51ed274e1"
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
