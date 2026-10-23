# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.65.3"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.3/moh-darwin-arm64"
      sha256 "c38fe3f2d6666e127e905777f01442b9122dadd7ca28ad6263543f7e509458cf"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.3/moh-darwin-x64"
      sha256 "415f548a08d3fbfd1667bc5f1ed1674d7f16308335eb5652ab5289007a7d38c4"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.3/moh-linux-x64"
    sha256 "0beda7874bc374ad6796c419ed40ca6f6f07e03a2e70a17e5fbeba2aeb747675"
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
