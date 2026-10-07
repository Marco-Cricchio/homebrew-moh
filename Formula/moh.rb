# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.59.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.59.1/moh-darwin-arm64"
      sha256 "6e1b03dac2a84283bfe789eff984801a472a9f7d760cdc7ca4868f27bf72da7b"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.59.1/moh-darwin-x64"
      sha256 "1a4fdbc0650ea9ac75e435f2acbbaf678ab7f1ac70364ca730d7ec336df72385"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.59.1/moh-linux-x64"
    sha256 "a369c715ee8f9eae19acbec309956abc5799c6a01bba51a95eb85a2bf53851c8"
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
