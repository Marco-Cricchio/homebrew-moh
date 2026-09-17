# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.38.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.38.2/moh-darwin-arm64"
      sha256 "2932833e0c77e2966e3e81619e8c7ad28ad06d8271a5fc3767b7d33bf470f97d"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.38.2/moh-darwin-x64"
      sha256 "a13ce8e95778ff5f63c9ee96a6b8c11452b6b5b7e9d53bc490a373d704e434f0"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.38.2/moh-linux-x64"
    sha256 "495373f0952f93735c33e57d94bb2457389eb4c82b0707d661aff13f2d51e020"
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
