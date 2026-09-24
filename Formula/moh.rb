# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.49.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.49.0/moh-darwin-arm64"
      sha256 "3e5c2845aa7e4f6fca7f53833ba5f52df9e52187c82c9a661967bcea66c993b2"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.49.0/moh-darwin-x64"
      sha256 "b3eb143932a4e05f8a189dbbaee4d9461904484a8491c52a771647c3ebb4f4e4"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.49.0/moh-linux-x64"
    sha256 "4a06aa484df5ac5c108f6dc4a3131ce9017a29c49f87cd48fae77a1ea181ef7a"
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
