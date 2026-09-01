# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.13.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.13.0/moh-darwin-arm64"
      sha256 "7ed5bdfa6b8a48ee4bdd97b1bbdeea47f780bdfd8c6fe75727e7c7e9fea6dcba"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.13.0/moh-darwin-x64"
      sha256 "e54647b5b0fd9ae2f2ed0156ec1ff51d779ab951ea5565f81e1ea0bb1f174343"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.13.0/moh-linux-x64"
    sha256 "f24bd1786524053bf377016efad01a8e7b505dbbd64c7f1c527310f7343f8b04"
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
