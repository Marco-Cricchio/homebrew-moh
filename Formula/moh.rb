# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.52.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.52.0/moh-darwin-arm64"
      sha256 "535b88898cc64ad5937ca9cb1f20489f34db3bc519289ab16ec909d635f33391"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.52.0/moh-darwin-x64"
      sha256 "ec16cf642008979aec1bb0e33bde9ab0291d4acaf3a724096af086037d23a344"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.52.0/moh-linux-x64"
    sha256 "113dce8906a3d6c880e6d2c0bcb14a90af4c7ea9692cb0e919d6f72effa08cff"
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
