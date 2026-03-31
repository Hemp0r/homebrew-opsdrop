class Opsdrop < Formula
  desc "CLI for sharing files and clipboard snippets across devices via OpsDrop"
  homepage "https://github.com/hemp0r/opsdrop"
  version "1.0.1-beta1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-darwin-arm64"
      sha256 "eabcd3cb0533a6cdc1c164f0566fb4b3a36ab3f7521bc4c41083d63299fa1e85"
    else
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-darwin-amd64"
      sha256 "983cfeb57d434d3025b11b9151e1b3d4f074355d2a71d6e549075ce070939299"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-linux-arm64"
      sha256 "7dc865a66064acb000bc541d9899a7889c179e1f6b701aee77ba95e1b68b6ebf"
    else
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-linux-amd64"
      sha256 "0940e858ebc1fd39c7842d82bc82424e98beed7b48cdbe1fb73562cd21a1e884"
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
