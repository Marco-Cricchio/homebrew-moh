# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.56.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.56.0/moh-darwin-arm64"
      sha256 "2a8282f78815175cbdac7229bb7645c620d50867be4424c2a8694769f770cee0"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.56.0/moh-darwin-x64"
      sha256 "b68445bfce8e47488fd9869461e4b40bad38ed7800bb43b0afc659f6f2712c67"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.56.0/moh-linux-x64"
    sha256 "5dfd5e10d7c4abfcdab9768b302e6ef6431d98fdf5d7bd38bc2f64faf2d7eb7a"
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
