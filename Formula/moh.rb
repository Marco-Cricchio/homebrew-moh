# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.34.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.34.0/moh-darwin-arm64"
      sha256 "f69ee9b7fc904953c86b30f802100349e070631274d7c294f744a719e85a3b3d"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.34.0/moh-darwin-x64"
      sha256 "44a70422af57931a7b54648a23488979187cff268c8c1130c606e11bf87bee9c"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.34.0/moh-linux-x64"
    sha256 "04f569d01dfd06d7b1421a46de3a433b1abe9a0470051247b0aa685693396d6a"
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
