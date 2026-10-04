# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.58.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.58.0/moh-darwin-arm64"
      sha256 "ee04a36954e527b7b001a4d80e15a9178afeff58714db8aa37179a85b5215890"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.58.0/moh-darwin-x64"
      sha256 "11bd2d7cdc0e1108e4be21acca11a32023f6aca970b4fc292c8feb48d633e595"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.58.0/moh-linux-x64"
    sha256 "94daef349c44b483a1ce6df98fe2b93a18b9ec1946c2a589456dca2e5108beaa"
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
