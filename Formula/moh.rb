# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.58.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.58.2/moh-darwin-arm64"
      sha256 "020c010ca932cd11d807e93fbf114a394371987593d75fdfa8a98dc01b374ee0"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.58.2/moh-darwin-x64"
      sha256 "4651060efd8091e594e85538e850fad67d8a7ed061ee1886711e44673e9178f7"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.58.2/moh-linux-x64"
    sha256 "bb8cae729b25f6e6858fc9c039a4881e6e4e0e14e840cf3b4c3c14921400911a"
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
