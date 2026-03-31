class Opsdrop < Formula
  desc "CLI for sharing files and clipboard snippets across devices via OpsDrop"
  homepage "https://github.com/hemp0r/opsdrop"
  version "1.0.1-beta2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-darwin-arm64"
      sha256 "21fb9ecbab4ce9c0ae3528f785acf91f7aca1dc5cef32a89899da46d024c0b82"
    else
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-darwin-amd64"
      sha256 "f4aecbc7aea9312b1fdf28d9d8127d0fbb1dd2e858ae15967d9ea0066d79e8a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-linux-arm64"
      sha256 "3e06d680acb50b9023c58f10f3bc12735b9aee0e37e49c3be772ee5446bb88d2"
    else
      url "https://github.com/hemp0r/opsdrop/releases/download/v#{version}/opsdrop-linux-amd64"
      sha256 "42e33562a132e0f0f31ddf7b9f1d8d6b8199a98e311e4f487b14cb5027285aaa"
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
