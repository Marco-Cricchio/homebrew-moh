# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.41.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.41.0/moh-darwin-arm64"
      sha256 "16910b05acf3f6cffa5c272fda423429bc65ba7743943e782d7db8eae9bdfc79"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.41.0/moh-darwin-x64"
      sha256 "28d4c172647181aa91ef24dc7dbb52684f2fdc21a7498bf3a5c538989956d33b"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.41.0/moh-linux-x64"
    sha256 "8f6e69fe1f9609f8a878b2e09432a609d7caeedcc417b037d6766eeeb69b2841"
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
