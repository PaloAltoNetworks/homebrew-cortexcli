class CortexcliAT0111 < Formula
  desc "Cortex CLI"
  homepage "https://docs-cortex.paloaltonetworks.com/"
  version "0.111.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.111.0/cortexcli-0.111.0-darwin-arm64.tar.gz"
      sha256 "75b204d623c4d5002c3f2d0e96a8b6409712c7c46df4ca83eb47667697e0f889"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.111.0/cortexcli-0.111.0-darwin-amd64.tar.gz"
      sha256 "5948902d116cd423cebe6d18b59c6a763c4ebab3f295750e69caf3390bccdb09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.111.0/cortexcli-0.111.0-linux-arm64.tar.gz"
      sha256 "d5e65fa786be392224b51a4051ddc1d586253f8f2bbd34ab9568a97f59e0d565"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.111.0/cortexcli-0.111.0-linux-amd64.tar.gz"
      sha256 "4d7734496ae3cba003f068cd57e537170f5b99e24fd1d6351e2e79118e38d38a"
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
