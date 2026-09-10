class CortexcliAT037 < Formula
  desc "Palo Alto Networks Cortex unified CLI (pinned 0.37.x)"
  homepage "https://docs-cortex.paloaltonetworks.com/"
  version "0.37.0"
  license :cannot_represent

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.37.0/cortexcli-v0.37.0-darwin-arm64.tar.gz"
      sha256 "42b723698ad63000695692a324205c29f10d7ffb8156f43511bc990de1039fc8"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.37.0/cortexcli-v0.37.0-darwin-amd64.tar.gz"
      sha256 "c54e4a13dd189ed211d5b9ba94ba8f278174bc6764d74ec29839df5da0db4b00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.37.0/cortexcli-v0.37.0-linux-arm64.tar.gz"
      sha256 "af5ea783a1afe30af23a353b1a1ee5fbee0f31f1c75fd98bbc0cd5bdc9f205c9"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.37.0/cortexcli-v0.37.0-linux-amd64.tar.gz"
      sha256 "ca2c8233a0d2864a6d2853fd8a4e2ee219ac242ee617dc6de15d9c7c42af9a8b"
    end
  end

  def install
    bin.install "cortexcli"
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", bin/"cortexcli" if OS.mac?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cortexcli --version")
  end
end
