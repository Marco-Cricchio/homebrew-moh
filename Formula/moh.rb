# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.67.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.67.2/moh-darwin-arm64"
      sha256 "06427d78f0089fb4da61af6328ec45ffdc69363d9e3f8b1a20b92a64f9d7158a"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.67.2/moh-darwin-x64"
      sha256 "056250303c8003ac6cdf98405a520797b88685044d8267b9f539b4105dec3b82"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.67.2/moh-linux-x64"
    sha256 "e52a544bfaddbba7467f780a48b57540051152df25a9cf7a639d0a9cebcc7fad"
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
