# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.39.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.39.1/moh-darwin-arm64"
      sha256 "f6e0ec52008363f9150475c3359613f44a6803d96f29bb3555f82efe256f6634"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.39.1/moh-darwin-x64"
      sha256 "a7224b3ca59c2e8ab0e061a3094301983f2efe5c47476f7ef3c702686dc8b476"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.39.1/moh-linux-x64"
    sha256 "20b5c640a4a5640b44dc648cae7b004d499d46227caf38ff5e5e052f5e8e5d97"
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
