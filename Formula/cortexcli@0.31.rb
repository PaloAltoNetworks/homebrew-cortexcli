class CortexcliAT031 < Formula
  desc "Palo Alto Networks Cortex unified CLI (pinned 0.31.x)"
  homepage "https://docs-cortex.paloaltonetworks.com/"
  version "0.31.0"
  license :cannot_represent

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.31.0/cortexcli-v0.31.0-darwin-arm64.tar.gz"
      sha256 "2ce305912448d09842351497d471189dc3ed5f3b2f19dc45b7a7902e90917591"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.31.0/cortexcli-v0.31.0-darwin-amd64.tar.gz"
      sha256 "b13d0998a975c1eb849eaba25e2e96f23bfc29a775c0175fa020469b811939e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.31.0/cortexcli-v0.31.0-linux-arm64.tar.gz"
      sha256 "38f324b807f6a75094da81987d44d4ab4684117c63b77334e7b3c8a5b9c61cc7"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.31.0/cortexcli-v0.31.0-linux-amd64.tar.gz"
      sha256 "33b076102d5a8f8755b4430b44ef2bee078343069f3b13c9977267870d194162"
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
