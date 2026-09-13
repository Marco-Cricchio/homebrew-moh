# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.32.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.32.2/moh-darwin-arm64"
      sha256 "cdffa5b7424295f0b7ed48598e0a08546d6e9679293e8ba3f9f4724a14f07268"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.32.2/moh-darwin-x64"
      sha256 "677d8195d2378f9130a7c6564bcfe1e05f33d13f1cdf572ee4fce4346bfaf250"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.32.2/moh-linux-x64"
    sha256 "65f29147589f84fba8ef38977e48204976d74d4b41d7d2db8ed0faff6c79c9d5"
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
