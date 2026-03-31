class Opsdrop < Formula
  desc "CLI for sharing files and clipboard snippets across devices via OpsDrop"
  homepage "https://github.com/hemp0r/opsdrop"
  version "1.0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-darwin-arm64"
      sha256 "22bda5afa494155adffaba4911c539f5044fa3088f5e988293c77c647f345d9a"
    else
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-darwin-amd64"
      sha256 "59c6b21d9bb1b886506b9913d7a6d47182722e691dc985971206f2110c8dfbb4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-linux-arm64"
      sha256 "24879fbc470f5318cf583367a49bf4e2eb8775aaf33ffd72373c4711d04545a1"
    else
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-linux-amd64"
      sha256 "1b466d668f90bc8bf6cf13c4b98197dffbe2d0a8020c9daed769a8f0c0de9344"
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
