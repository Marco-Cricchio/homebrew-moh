# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.16.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.16.0/moh-darwin-arm64"
      sha256 "f9b799adc8a429169d21a4b175e3c600f3ae7eb2a0401b00c324dfa4233bf966"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.16.0/moh-darwin-x64"
      sha256 "7f26921218ffeae357d14d6bcc410fc79012b70018ba634150d1733de790570d"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.16.0/moh-linux-x64"
    sha256 "cfdce39ae5770659920f4e8bb3d341b5f01d7910aa878fed804caa4b2922b7a6"
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
