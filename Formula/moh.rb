# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.65.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.2/moh-darwin-arm64"
      sha256 "c8412a50d2a74d525465b05c0cac0f9e4c480f468d1a7aa2ba9756da622b3035"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.2/moh-darwin-x64"
      sha256 "2c9d45185a0bfe1b979a43d1613cc078b993dff82286d83e6e4512f78b426126"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.65.2/moh-linux-x64"
    sha256 "8997222fc1b10cc8fc0f645f8866dcfb102ae34d707fe0f992ad85dfe2ce17e6"
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
