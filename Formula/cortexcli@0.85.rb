class CortexcliAT085 < Formula
  desc "Cortex CLI"
  homepage "https://docs-cortex.paloaltonetworks.com/"
  version "0.85.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.85.0/cortexcli-0.85.0-darwin-arm64.tar.gz"
      sha256 "450ce6f96b90ebebb01e92e509bf67a08a4dabba005ae36026a28a5eb6197384"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.85.0/cortexcli-0.85.0-darwin-amd64.tar.gz"
      sha256 "734e7a6bc77fdb73fb415a7b841080d9cbeb6dbc01a7c7efeb098362cac276f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.85.0/cortexcli-0.85.0-linux-arm64.tar.gz"
      sha256 "a1b541fb6b904556aff87920ff6fbf113080ff631b6bd7d6ac24605233ea514b"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.85.0/cortexcli-0.85.0-linux-amd64.tar.gz"
      sha256 "1c58e921ea7f1f84ce5547a3570d68de676cfd7af076cb99e9ecc0093f5a8ffd"
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
