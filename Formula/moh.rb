# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.52.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.52.1/moh-darwin-arm64"
      sha256 "093122c666d454b0e525942312b0e0c07cd12247c936615249174122481ae5ba"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.52.1/moh-darwin-x64"
      sha256 "929fab363b62741d8d92a8cacdbc271e5eb2bf9ae55178d955ad983ee45e699e"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.52.1/moh-linux-x64"
    sha256 "082d3cfca7e8dbbe675a0dc6829c5d0ad2ee403901d4a3b40adc4dbd10977545"
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
