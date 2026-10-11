# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.64.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.2/moh-darwin-arm64"
      sha256 "155f1cd76c965495eb1f811f2f7df1aec1a91dce7f2c539644ec751190342783"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.2/moh-darwin-x64"
      sha256 "b8f82d08e1f579f20ee52cd108a8bbec49cad8cacdcb5c08d12eea7276e8627f"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.2/moh-linux-x64"
    sha256 "add0a5c6f0f1b5ce4eccf0c8c8eaeb2d539393d30738080b6c4ecab1afce2d10"
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
