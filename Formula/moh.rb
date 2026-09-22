# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.45.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.45.0/moh-darwin-arm64"
      sha256 "db0a53aa5ff3a0bf440872b12dab133538c6ac4dda85489b0f8cb7526dd07432"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.45.0/moh-darwin-x64"
      sha256 "2167a63713cc13f6e4f13ef27e2dc670748e2b56a349047132b94fead5efd5c4"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.45.0/moh-linux-x64"
    sha256 "77c4b6c721796c41d16c1cae4a1a9e9d96449f95eb453489402db717264824c6"
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
