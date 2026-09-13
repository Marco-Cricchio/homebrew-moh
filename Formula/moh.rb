# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.32.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.32.1/moh-darwin-arm64"
      sha256 "98fc69f9d6187835b6615c3d4923ad86da56bdaae4386d47b4600e03b8aa24c7"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.32.1/moh-darwin-x64"
      sha256 "89e69991ba9e6db3b72445581b17982035949e47f4ed5b7491156c74c7c815f5"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.32.1/moh-linux-x64"
    sha256 "23201ddd12dd391975579b7fbe0a2f46f2525ad6b35e91aa5b6570076269e9c7"
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
