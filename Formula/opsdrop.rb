class Opsdrop < Formula
  desc "CLI for sharing files and clipboard snippets across devices via OpsDrop"
  homepage "https://github.com/hemp0r/opsdrop"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-darwin-arm64"
      sha256 "0c2afe770674a16129bd5567857bb420890d119b4edb599719a8457baa3ce43a"
    else
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-darwin-amd64"
      sha256 "1853a65ebbb1beed7e16fdecb27a8d7e54740f20aaba81bfefaf8500380fa2a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-linux-arm64"
      sha256 "dbebc2a2fe875ab9831a6e0a4dc28b1f1ee2aab9162b146d8107d658614a1fdc"
    else
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-linux-amd64"
      sha256 "040a7d84f980168b98b69fae388ea8a6b0b679a47174a4ae47fc4fd8cbaaec45"
    end
  end

  def install
    binary = Dir.glob("opsdrop-*").first
    bin.install binary => "opsdrop"
  end

  test do
    assert_match "opsdrop version", shell_output("#{bin}/opsdrop --version")
  end
end
