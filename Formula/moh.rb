# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.66.3"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.66.3/moh-darwin-arm64"
      sha256 "803159b6c77681d3ba9b42d573a20fe2b1a8ba6419f7460bbd962306c0f794b5"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.66.3/moh-darwin-x64"
      sha256 "40dd37fa39a504990a7ac1801aef4e1b76671a7d58438192df414af183bde009"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.66.3/moh-linux-x64"
    sha256 "587224ca5518484d75712a146347469095472d8f4336603163a42be37d16df09"
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
