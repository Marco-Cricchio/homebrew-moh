# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.24.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.24.0/moh-darwin-arm64"
      sha256 "9a24c7ecbf06aa19a7cf38b019819894debca6574433dd0d0411554df298d8bb"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.24.0/moh-darwin-x64"
      sha256 "2929214c74b613c18f4010e28236e26f02e1067e4994d5e7156bd07d90f9b882"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.24.0/moh-linux-x64"
    sha256 "0b032f87a634a4b78189d95639c4224b627615ca4393d9cfe337d7e1dff7578d"
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
