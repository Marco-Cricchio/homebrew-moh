# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.17.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.17.1/moh-darwin-arm64"
      sha256 "9515afb5966bcb56127cc75af3a9b9eedc5940d87068bb27e01586d76371e25b"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.17.1/moh-darwin-x64"
      sha256 "0d71960ab350a039c778aa0bf686d4f049727c92db79b7fec28df2d0fbd91b36"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.17.1/moh-linux-x64"
    sha256 "f5a6144863ff9d6951925099f4a42388cc9d48442768be7a6992738af090207f"
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
