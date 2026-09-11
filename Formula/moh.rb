# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.29.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.29.0/moh-darwin-arm64"
      sha256 "11f7c6e83dbc1e7665cd89990b18ea03399df8c23e05d38f6d24fc168ec31bfe"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.29.0/moh-darwin-x64"
      sha256 "54233bae8c6137c79ec24e6d01b3dbed0c7b0d78a73590dccc14d496e4f8a8ab"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.29.0/moh-linux-x64"
    sha256 "bc6028702fcddd76705cc9b96f0e6ca1124898588f7f263f98ac1160e349e8f8"
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
