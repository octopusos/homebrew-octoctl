class Octoctl < Formula
  desc "Local manager control CLI for OctopusOS"
  homepage "https://github.com/octopusos/octoctl"
  version "0.0.0"

  if Hardware::CPU.arm?
    url "https://github.com/octopusos/octoctl/releases/download/v0.0.0/octoctl-v0.0.0-darwin-arm64"
    sha256 "REPLACE_ME"
  else
    url "https://github.com/octopusos/octoctl/releases/download/v0.0.0/octoctl-v0.0.0-darwin-amd64"
    sha256 "REPLACE_ME"
  end

  def install
    bin.install Dir["octoctl-v*-darwin-*"].first => "octoctl"
  end

  test do
    system "#{bin}/octoctl", "--help"
  end
end
