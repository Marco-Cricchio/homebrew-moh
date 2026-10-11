# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.64.5"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.5/moh-darwin-arm64"
      sha256 "706a319bbc06e4f721fd19728d54d45669db789717a68cd76be6280155092e47"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.5/moh-darwin-x64"
      sha256 "d0da60d014dc9b0efe4ff0651039a1cbe00faaf61a103ca5e66a0ccd568c27ce"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.64.5/moh-linux-x64"
    sha256 "7a153844f6371d28c3e916acd2206caf7104888019c59a03fd71731a12715d9c"
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
