# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.26.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.26.0/moh-darwin-arm64"
      sha256 "2dd835b96da446028504701b4bdb100c563b6b68e361156d4997ae329648c899"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.26.0/moh-darwin-x64"
      sha256 "eba217cbd843c8d2ad6cf1970bd0aaf569cdfaa5d830a2e025415113cc146728"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.26.0/moh-linux-x64"
    sha256 "dac49e6ec5cf867597a6da7524923cc7edcbb8af6fe6d3d0d73657b8e4d8cbfd"
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
