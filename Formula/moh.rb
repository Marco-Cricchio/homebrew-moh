# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.51.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.51.0/moh-darwin-arm64"
      sha256 "6e6e43dab3e7cf08839310cf4eaca0ff8d826bcd4491b6455c7795f100fb6b05"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.51.0/moh-darwin-x64"
      sha256 "de73eb6644fc7a3e72841701dd914a6d817f98ba1820c7badf38cd7b39f57454"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.51.0/moh-linux-x64"
    sha256 "e70663df7c254623daec2e431776229697fc3e80c9e6d411355281cb19c05305"
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
