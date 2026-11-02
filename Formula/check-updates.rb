class CheckUpdates < Formula
  desc "Find what is out of date on your Mac and update it from a checklist"
  homepage "https://github.com/AntoineCAU/check-updates"
  url "https://github.com/AntoineCAU/check-updates/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "345c7f56ac12d49d6ed50f58b86f737b4ca7c802f58d35053762ce76e09ac314"
  license "MIT"

  depends_on :macos

  def install
    bin.install "bin/check-updates"
    prefix.install "libexec"
  end

  def caveats
    <<~EOS
      To check every day and get a window listing the available updates:
        check-updates install

      To make sure everything works on this Mac:
        check-updates doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/check-updates --version")
    system "zsh", "-n", bin/"check-updates"
  end
end
