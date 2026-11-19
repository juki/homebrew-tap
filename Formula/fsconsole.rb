class Fsconsole < Formula
  desc "Web console for operating FreeSWITCH over the Event Socket"
  homepage "https://github.com/juki/freeswitch-console"
  version "0.3.1"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/juki/freeswitch-console/releases/download/v0.3.1/fsconsole_0.3.1_darwin_arm64.tar.gz"
      sha256 "a1eb889bb8d3acf754411d1d13e255117e834a58946d31f65fe08b67bc13578f"
    end
    on_intel do
      url "https://github.com/juki/freeswitch-console/releases/download/v0.3.1/fsconsole_0.3.1_darwin_amd64.tar.gz"
      sha256 "f7dc72e7ee6ef952de49126f8e720a907687a348755d3feb91ad4c76912f70bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/juki/freeswitch-console/releases/download/v0.3.1/fsconsole_0.3.1_linux_arm64.tar.gz"
      sha256 "533157ac5253197a0b48136ba117d6857985eae767ba157867f3e9c6b0c48bdd"
    end
    on_intel do
      url "https://github.com/juki/freeswitch-console/releases/download/v0.3.1/fsconsole_0.3.1_linux_amd64.tar.gz"
      sha256 "60c774fa257c6e5d9cc024db60ec29c637c07b6254353adefde6f455ddb5d37a"
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
