# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.32.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.32.0/moh-darwin-arm64"
      sha256 "72d60ceaf552348a87396d18b3e572bcc209df9866ee324b70a4f91660adad45"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.32.0/moh-darwin-x64"
      sha256 "291511e509665154b8aef803430172769167e3bfe4830a31d33b9372b396ee14"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.32.0/moh-linux-x64"
    sha256 "b5209c7629ee0d2f69f923d035495a62b8f34fe542e36395e7b688f51e293559"
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
