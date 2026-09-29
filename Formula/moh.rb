# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.53.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.53.0/moh-darwin-arm64"
      sha256 "82c8e9d54f1bc10c4cf0ebda22c1c4b9254ec50c37fd574cf1626bbf63aee77f"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.53.0/moh-darwin-x64"
      sha256 "ce0c40b095c858425adeebe4da6a40dbe3ead746fe5b86baedf45a7866ad5674"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.53.0/moh-linux-x64"
    sha256 "46f2e8709fd3a6892818502c259a85f95b8db402e1a5268452620d6fa2efdcaa"
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
