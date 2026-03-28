class Opsdropctl < Formula
  desc "CLI for sharing files and clipboard snippets across devices via OpsDrop"
  homepage "https://github.com/hemp0r/opsdrop"
  version "1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdropctl-darwin-arm64"
      sha256 "69b8208bd4b6d051c0d454d6e891af873a151c909f2fc16ceb81e3449efc6734"
    else
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdropctl-darwin-amd64"
      sha256 "348549810db4318f4d534c103c9693f19ec12c4a3017f18285850098e981d89b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdropctl-linux-arm64"
      sha256 "fb053997f3cc2413b3fbba9ef86d9c22274d46a75e3b682a39b2a347ac0caa35"
    else
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdropctl-linux-amd64"
      sha256 "7b00f672107e0bdbd30a639bba63b7c635e2fa7030655234c9859f4057cf4e02"
    end
  end

  def install
    binary = Dir.glob("opsdropctl-*").first
    bin.install binary => "opsdropctl"
  end

  test do
    assert_match "opsdropctl version", shell_output("#{bin}/opsdropctl --version")
  end
end
