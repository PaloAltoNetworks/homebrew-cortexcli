class Cortexcli < Formula
  desc "Cortex CLI"
  homepage "https://docs-cortex.paloaltonetworks.com/"
  version "0.101.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.101.0/cortexcli-0.101.0-darwin-arm64.tar.gz"
      sha256 "12add00042912aac058614c10e3d7e41eab9831cb8131f5602bdafc0fdb482ec"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.101.0/cortexcli-0.101.0-darwin-amd64.tar.gz"
      sha256 "2d116ecd45fab9cc209176b16393d9c2d1ac444547c3c4e9975d8061e70fc836"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.101.0/cortexcli-0.101.0-linux-arm64.tar.gz"
      sha256 "c8c15fe96257b003c76024f8b988ca51eedc43f24819866c7e38e85b69a2721b"
    end
    on_intel do
      url "https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v0.101.0/cortexcli-0.101.0-linux-amd64.tar.gz"
      sha256 "6e357d5899d9a5957312adfe0d2a7452ab26d311208a71e0f25e53d75de575ac"
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
