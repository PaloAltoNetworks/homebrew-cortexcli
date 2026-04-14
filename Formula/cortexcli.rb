class Cortexcli < Formula
  desc "Palo Alto Networks Cortex unified CLI for Workloads, APIs and Code scanning"
  homepage "https://docs-cortex.paloaltonetworks.com/"
  version "0.18.0"
  license :cannot_represent

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.18.0/cortexcli-v0.18.0-darwin-arm64.tar.gz"
      sha256 "273f46f1a0ec666aa51968a87c9d95b2921e660f2d9c5f0b637acad87ce44b75"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.18.0/cortexcli-v0.18.0-darwin-amd64.tar.gz"
      sha256 "7779440ae93ceec3415606116def038c50b04066f5eca9a758b0cc1962e6f286"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.18.0/cortexcli-v0.18.0-linux-arm64.tar.gz"
      sha256 "587bf1d5d927277730ade0d2afa3ae221efcc46141cb749675bacc94b18ae22d"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.18.0/cortexcli-v0.18.0-linux-amd64.tar.gz"
      sha256 "5d1c251a54ff29dfd2be64c0bfec6580e53add0a7cd0f6318da7e4b2804dd925"
    end
  end

  def install
    bin.install "cortexcli"
    # Binary is codesigned but not yet notarized; strip the quarantine xattr
    # that Homebrew's downloader adds. Remove once notarization is in CI.
    system "/usr/bin/xattr", "-dr", "com.apple.quarantine", bin/"cortexcli" if OS.mac?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cortexcli --version")
  end
end
