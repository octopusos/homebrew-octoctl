class Octoctl < Formula
  desc "Local manager control CLI for OctopusOS"
  homepage "https://github.com/octopusos/octoctl"
  version "3.4.0"

  if Hardware::CPU.arm?
    url "https://github.com/octopusos/octoctl/releases/download/v3.4.0/octoctl-v3.4.0-darwin-arm64"
    sha256 "b67b5d010f990583c36c72d8b8fd3e3ad63e5d32d28b372abd5f96371a17d4ac"

    resource "octopus-manager" do
      url "https://github.com/octopusos/octoctl/releases/download/v3.4.0/octopus-manager-v3.4.0-darwin-arm64"
      sha256 "84c568879bc2786adb9749eefcee9cd369219d08e6126b425189949049625d98"
    end
  else
    url "https://github.com/octopusos/octoctl/releases/download/v3.4.0/octoctl-v3.4.0-darwin-amd64"
    sha256 "179931a64efe458ccd62ac4beca00b40b3529e55c8e4959432cc0dfdddd08b83"

    resource "octopus-manager" do
      url "https://github.com/octopusos/octoctl/releases/download/v3.4.0/octopus-manager-v3.4.0-darwin-amd64"
      sha256 "34ee91cc941a39fd57fff00c2b30c51428143d9ed5c2450c6e62ddb68450a850"
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
