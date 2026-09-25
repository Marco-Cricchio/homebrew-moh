# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.50.3"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.50.3/moh-darwin-arm64"
      sha256 "a841d25dcdbd6f9aa5d2ca781ef5212e91f4212a1e5b59886c987a4e8f6cf0a6"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.50.3/moh-darwin-x64"
      sha256 "3ec2a48a16ff96ef665daf402b289a6005adb31642b3e9679fb39fc900b3c1e6"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.50.3/moh-linux-x64"
    sha256 "96574662c678a665c86c24f015615ea268109c75579c5138cee406ee2cbe7c01"
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
