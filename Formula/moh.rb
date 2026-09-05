# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.19.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.19.0/moh-darwin-arm64"
      sha256 "d025eac5b86f0960fac1e0f97c961cfbf55e3b36feb41fed5dc33e725ab91751"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.19.0/moh-darwin-x64"
      sha256 "79750c92f88c758aeec26f1eecbdb771004df3be178e907e49a4363c8cc1fd59"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.19.0/moh-linux-x64"
    sha256 "d2585411bf0bc42aa18a13f392577db8708028b757242e3aae1ef3fa98a0a9d9"
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
