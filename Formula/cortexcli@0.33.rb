class CortexcliAT033 < Formula
  desc "Palo Alto Networks Cortex unified CLI (pinned 0.33.x)"
  homepage "https://docs-cortex.paloaltonetworks.com/"
  version "0.33.0"
  license :cannot_represent

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.33.0/cortexcli-v0.33.0-darwin-arm64.tar.gz"
      sha256 "6bbb0e3833d9ebf7a3f24bb7655e2e128ca0396c13dd521f5c1f7bb2a6d09219"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.33.0/cortexcli-v0.33.0-darwin-amd64.tar.gz"
      sha256 "c81c76b76c3e137564bf382e654d74c3e34b882cbc8f131b0621dfdb9632576b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.33.0/cortexcli-v0.33.0-linux-arm64.tar.gz"
      sha256 "53a88af3445f1b11ed94de3a7591a8fee7ac68b7c1ee410ec8bc0ce8ceca2531"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.33.0/cortexcli-v0.33.0-linux-amd64.tar.gz"
      sha256 "a05a47a5c16f505cfa823bcd0d792c787bc9514962812cee24090b3084f684fd"
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
