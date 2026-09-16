# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.35.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.35.0/moh-darwin-arm64"
      sha256 "077214edd9c9b62d71df7030de671a35d10043d48b0a0e0f8e6ab029dee77e9d"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.35.0/moh-darwin-x64"
      sha256 "a221480e4186df348bf5b7e2f6496ee96f23ded0b1f5e9f4346de37d01587307"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.35.0/moh-linux-x64"
    sha256 "852c7e1de8c8b465f6717a8a95aecaf4a4bf3b36d5cd59050d75ee65a8ebd4af"
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
