class CortexcliAT032 < Formula
  desc "Palo Alto Networks Cortex unified CLI (pinned 0.32.x)"
  homepage "https://docs-cortex.paloaltonetworks.com/"
  version "0.32.0"
  license :cannot_represent

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.32.0/cortexcli-v0.32.0-darwin-arm64.tar.gz"
      sha256 "980f9f3529ebeca2e198cf2e94d88f31abced67a70088eaa7f0cbfc6c4915901"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.32.0/cortexcli-v0.32.0-darwin-amd64.tar.gz"
      sha256 "9d4544d4808369460b41c872b96010dde1f6709d516bfdadc40f4fc49814777d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.32.0/cortexcli-v0.32.0-linux-arm64.tar.gz"
      sha256 "bfbd2bcd4b187394dc9348ba4e5ff58bc92cdacbf0dc3c178908f52271830b75"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.32.0/cortexcli-v0.32.0-linux-amd64.tar.gz"
      sha256 "d19aa547ffd7f5ec959238673f82546a13c24aa52a865601b7fff4a54cefc18e"
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
