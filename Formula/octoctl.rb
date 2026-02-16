class Octoctl < Formula
  desc "Local manager control CLI for OctopusOS"
  homepage "https://github.com/octopusos/octoctl"
  version "3.5.0"

  if Hardware::CPU.arm?
    url "https://github.com/octopusos/octoctl/releases/download/v3.5.0/octoctl-v3.5.0-darwin-arm64"
    sha256 "a4ac2a5c8f39b40978db1c392507dc9187ee3a0cf681faa5c6f161b5d45cb1bd"

    resource "octopus-manager" do
      url "https://github.com/octopusos/octoctl/releases/download/v3.5.0/octopus-manager-v3.5.0-darwin-arm64"
      sha256 "3792f6596a902ea20e5ae9738d14f0dbf8876247816f83b0c8170514ad05a7cd"
    end
  else
    url "https://github.com/octopusos/octoctl/releases/download/v3.5.0/octoctl-v3.5.0-darwin-amd64"
    sha256 "6b14fc5f64f5876912818e51683f96e4a4ee46431257b2b35eb2ebae8b0e6953"

    resource "octopus-manager" do
      url "https://github.com/octopusos/octoctl/releases/download/v3.5.0/octopus-manager-v3.5.0-darwin-amd64"
      sha256 "7b29d51df6014b7d605714f7b0ad3af83c9bfc413433e0056aac6e23d9951ac6"
    end
  end

  def install
    bin.install Dir["octoctl-v*-darwin-*"].first => "octoctl"
    chmod 0555, bin/"octoctl"

    resource("octopus-manager").stage do
      bin.install Dir["octopus-manager-v*-darwin-*"].first => "octopus-manager"
    end
    chmod 0555, bin/"octopus-manager"
  end

  test do
    system "#{bin}/octoctl", "--help"
  end
end
