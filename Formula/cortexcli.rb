class Cortexcli < Formula
  desc "Cortex CLI"
  homepage "https://docs-cortex.paloaltonetworks.com/"
  version "0.78.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.78.0/cortexcli-0.78.0-darwin-arm64.tar.gz"
      sha256 "60f3cdf16d8ff58ab18d8be854b004cbc9f3838c926917be72078433da329e1d"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.78.0/cortexcli-0.78.0-darwin-amd64.tar.gz"
      sha256 "8aadbf990c7acade445c51c5804757839f47d3308805cf29a18740254c46c799"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.78.0/cortexcli-0.78.0-linux-arm64.tar.gz"
      sha256 "f6cac1a9085209ef60fd04480c774b2439d3d1fed0dc809433891f6b4ffdcfd2"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.78.0/cortexcli-0.78.0-linux-amd64.tar.gz"
      sha256 "67a8db79dfd76ff97dea25b94cfdbf4db1fb1f9d34f63ec948d06d60e2318c96"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    if OS.mac?
      system "/usr/bin/xar", "-xf", "cortexcli.pkg"
      system "/bin/sh", "-c", "/usr/bin/gunzip -dc Payload | /usr/bin/cpio -idm"
      bin.install "cortexcli"
    else
      bin.install "cortexcli"
    end
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", bin/"cortexcli" if OS.mac?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cortexcli --version")
  end
end
