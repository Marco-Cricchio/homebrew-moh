# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.59.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.59.2/moh-darwin-arm64"
      sha256 "ee237aa20712559216078284515f1f912a1f57c097aef44e4110eb0530ec4add"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.59.2/moh-darwin-x64"
      sha256 "854c411543acc3a887f0eb73f4c4b64dea454e15770478ee0dfc357340c2627d"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.59.2/moh-linux-x64"
    sha256 "9d473d882260a098ed73d628b212c4ef1d28dc9ed0380643c828c2b4e23e7488"
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
