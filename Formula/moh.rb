# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.64.4"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.4/moh-darwin-arm64"
      sha256 "7ae9ff8e1b80b455f0f64a7ef1ef2e03883f9e142ffe9665d8de7f243f9500f8"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.4/moh-darwin-x64"
      sha256 "0811d9ddb6dddb571cd7a47f4e196956f9e52418b8d5dc5756d4db0b1e5cdfe5"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.4/moh-linux-x64"
    sha256 "182e63acfcffb1e41029c9f7c03b09433f15de4e0017c47cb2dcace1ff2c3878"
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
