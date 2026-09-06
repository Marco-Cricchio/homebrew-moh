# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.23.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.23.1/moh-darwin-arm64"
      sha256 "868ab8aaa47e48d0711097c3143aada7f8bb49f984d6812a3b5569f5816ec6ce"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.23.1/moh-darwin-x64"
      sha256 "9d20b76667af8b9f6dc0553a0e06311a9c80ed8965350d01c4a50194cac33d63"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.23.1/moh-linux-x64"
    sha256 "e9163ec380d6daf8af179d0baab9f521f1884d48c5914a7e34782a1a0362f734"
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
