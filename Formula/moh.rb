# Managed by .github/workflows/update-tap.yml — do not edit by hand.
class Moh < Formula
  desc "Provider-agnostic, headless-first coding agent with the Matt Pocock workflow built in"
  homepage "https://github.com/Marco-Cricchio/moh"
  version "0.52.2"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.52.2/moh-darwin-arm64"
      sha256 "6ecdccabc2fdef04fe52a676dcd093a0bffc66c5dcf33304d0b052bf4432700a"
    end
    on_intel do
      url "https://github.com/Marco-Cricchio/moh/releases/download/v0.52.2/moh-darwin-x64"
      sha256 "bc29fa9fa3819c6529060e07545334d3293be897555c8ec4245330907e803470"
    end
  end
  on_linux do
    url "https://github.com/Marco-Cricchio/moh/releases/download/v0.52.2/moh-linux-x64"
    sha256 "e76699a6fe7973a856361f705ab7400fc1afae88ade6d96f4a7cb7ccdde19ec2"
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
