# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.68.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.68.0/moh-darwin-arm64"
      sha256 "d9d7f6b8308395eaf121941b593544762c1cf654911a11326d43996638994680"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.68.0/moh-darwin-x64"
      sha256 "4c47dd45d461b865150fb64864cf1439c8bb6aee6bd3da7ab8a8e795af7de2f7"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.68.0/moh-linux-x64"
    sha256 "60c0e2d3c2a588b58f1961196003feacc647e460a936e2a3504e6daff47c05c6"
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
