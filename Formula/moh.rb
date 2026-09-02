# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.14.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.14.0/moh-darwin-arm64"
      sha256 "6bdc8c1427fce5305f604f0e5e81a06d2739cfd9b239536355108c0e131c1791"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.14.0/moh-darwin-x64"
      sha256 "fc567178859c4e3bf6da2fe9cc5aa4d5a15c9543a61ace9dadafd15a833b0aa8"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.14.0/moh-linux-x64"
    sha256 "82e68b937b1cc745cb7ff29a7c21fec778ec6eb2693231e0fef3dbab0a2cbbd9"
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
