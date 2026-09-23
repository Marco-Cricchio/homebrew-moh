# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.46.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.46.0/moh-darwin-arm64"
      sha256 "b63b6f60108fa087663a9dafe0e45b546d11cc136b85187c5d06f6cb3334aaa3"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.46.0/moh-darwin-x64"
      sha256 "32edddb7796e127199b84b4ceaf4c1ccd5fa7ad84da5d0312cd0bff3a5e329e9"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.46.0/moh-linux-x64"
    sha256 "cd823d97e89666993f7701a8ba833b16141fde7280267f9616479180442b3316"
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
