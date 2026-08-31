# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.10.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.10.0/moh-darwin-arm64"
      sha256 "5c83a3b973d51e0bea6ee2e796317d53ab957bcc5f87f71adbdb64bbc4b45fff"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.10.0/moh-darwin-x64"
      sha256 "4522b1bf2632d24bc8bc71cb78ad61f97512e53fd99cc37392a930887dcba1da"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.10.0/moh-linux-x64"
    sha256 "2ac4156db556c127a078983f40bf96dc7f9b0c09eccb6ebd91f53f086048a754"
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
