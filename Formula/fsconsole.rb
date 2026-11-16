class Fsconsole < Formula
  desc "Web console for operating FreeSWITCH over the Event Socket"
  homepage "https://github.com/juki/freeswitch-console"
  version "0.2.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/juki/freeswitch-console/releases/download/v0.2.0/fsconsole_0.2.0_darwin_arm64.tar.gz"
      sha256 "5fc35bb5669db338f381577019b95c61da102975287959b5b68df6db8c43b958"
    end
    on_intel do
      url "https://github.com/juki/freeswitch-console/releases/download/v0.2.0/fsconsole_0.2.0_darwin_amd64.tar.gz"
      sha256 "18ef20c08e25e23e88f45d2732eca8168dd17014c3d048c9fdce9f4b44650f22"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juki/freeswitch-console/releases/download/v0.2.0/fsconsole_0.2.0_linux_arm64.tar.gz"
      sha256 "3f6f0c0e5dc355e181d967c810ffbeb867be4dbfca58991e72698b4b2d2870fd"
    end
    on_intel do
      url "https://github.com/juki/freeswitch-console/releases/download/v0.2.0/fsconsole_0.2.0_linux_amd64.tar.gz"
      sha256 "19f7a9b7d66ca0270d363ad71664d880203a8e344da6400d8d8059c6b1bda297"
    end
  end

  def install
    bin.install "fsconsole", "fsconsole-agent"
  end

  def caveats
    <<~EOS
      Start the console and open http://127.0.0.1:8080:
        FSCONSOLE_ADMIN_PASSWORD='choose-a-long-one' fsconsole
      Or try it without a FreeSWITCH:
        fsconsole -demo
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fsconsole -version")
  end
end
