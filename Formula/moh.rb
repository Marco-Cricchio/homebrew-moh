# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.31.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.31.0/moh-darwin-arm64"
      sha256 "8202fca93d806072f5d5d145a901cdea2dbc73eef9c2751a056df43a5616a21b"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.31.0/moh-darwin-x64"
      sha256 "4cea4c685930d74a87cdfd8a931d267f37a97c5d6dccde81cbc05b588d80bb9e"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.31.0/moh-linux-x64"
    sha256 "fde2f4c749b371a2ee8b22e08eec2256927b9b0cb4da8f099a048b7ecde7beda"
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
