# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.21.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.21.1/moh-darwin-arm64"
      sha256 "f182008097f9dedd120ba42bb88c542ea6ec2907aeff0b16b44af659573f7a50"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.21.1/moh-darwin-x64"
      sha256 "2ff8e177ec07694cfa45eaa20af43d741a7ce4f6fac373e1cc7b4fad3620a3e3"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.21.1/moh-linux-x64"
    sha256 "b56b97f48571f5b12d08853c8f7259417394f46d78b7b71ececf31146d5eee26"
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
