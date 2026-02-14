class Octoctl < Formula
  desc "Local manager control CLI for OctopusOS"
  homepage "https://github.com/octopusos/octoctl"
  version "0.0.0"

  if Hardware::CPU.arm?
    url "https://github.com/octopusos/octoctl/releases/download/v0.0.0/octoctl-v0.0.0-darwin-arm64"
    sha256 "REPLACE_ME_OCTOCTL_ARM"

    resource "octopus-manager" do
      url "https://github.com/octopusos/octoctl/releases/download/v0.0.0/octopus-manager-v0.0.0-darwin-arm64"
      sha256 "REPLACE_ME_MANAGER_ARM"
    end
  else
    url "https://github.com/octopusos/octoctl/releases/download/v0.0.0/octoctl-v0.0.0-darwin-amd64"
    sha256 "REPLACE_ME_OCTOCTL_AMD"

    resource "octopus-manager" do
      url "https://github.com/octopusos/octoctl/releases/download/v0.0.0/octopus-manager-v0.0.0-darwin-amd64"
      sha256 "REPLACE_ME_MANAGER_AMD"
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
