# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.55.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.55.0/moh-darwin-arm64"
      sha256 "5be47443f22656e3209f853c615fda4e62cf1931ff9364c9bde495958c703883"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.55.0/moh-darwin-x64"
      sha256 "469210656ff5fa440d50173de16eb4e19cf64135c4ebd829a3f625ae98a75881"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.55.0/moh-linux-x64"
    sha256 "8084c3ac5cf9098665747fd954eff00cfddd72db590656cd37a045190c787a9c"
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
