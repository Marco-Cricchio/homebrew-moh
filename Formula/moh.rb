# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.67.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.67.0/moh-darwin-arm64"
      sha256 "3f4745f4e47cdf04d3cd8e3812e7a047d673aaccb63ae37dd5491b54ff2452b2"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.67.0/moh-darwin-x64"
      sha256 "4f0b30435c5a1cd3383258e909edb0c34b0879ad32a8d8435a057f8e4a575ae5"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.67.0/moh-linux-x64"
    sha256 "779ca7dcba6d2882a44f90b07f34b94c11526c3e314790e093f58f0a4ee13500"
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
