class CheckUpdates < Formula
  desc "Find what is out of date on your Mac and update it from a checklist"
  homepage "https://github.com/AntoineCAU/check-updates"
  url "https://github.com/AntoineCAU/check-updates/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "ed2e603cea6b2038e86be0e73c3dc8ecc0ce9497c1a5b3ab13e020a35ef22fb9"
  license "MIT"

  depends_on :macos

  def install
    bin.install "bin/check-updates"
    prefix.install "libexec"
  end

  def caveats
    <<~EOS
      Check now:
        check-updates

      Check every day (off by default):
        check-updates schedule on [HH:MM]
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/check-updates --version")
    system "zsh", "-n", bin/"check-updates"
  end
end
