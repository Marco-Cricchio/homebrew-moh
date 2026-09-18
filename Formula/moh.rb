# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.39.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.39.0/moh-darwin-arm64"
      sha256 "e33540447f23d0d5ed1fd333d09ca99994e77132d64ef72fe2f126d047c100d4"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.39.0/moh-darwin-x64"
      sha256 "a491e263b51f277677ed3340f93d0db40a8232dc9f19ba7c742e57221ee966d2"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.39.0/moh-linux-x64"
    sha256 "c3e0b0c5ced1d28f868ee09976a8ea5d3e0175bd589de947ab875d1a9c61278f"
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
