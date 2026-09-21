# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.44.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.44.0/moh-darwin-arm64"
      sha256 "38a5440ac62ac7f7f0ecd5fa70e5a19a383fc02f4705e700732ea0c1da42bf2c"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.44.0/moh-darwin-x64"
      sha256 "e1e0a86116f06d6d253f41975123c5c5057f00075792f339b9392d90126430e8"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.44.0/moh-linux-x64"
    sha256 "7ac26196e60566b2b131305f3f41fc2a17eca6c2994cf947704ccb729995c5c8"
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
