class CheckUpdates < Formula
  desc "Find what is out of date on your Mac and update it from a checklist"
  homepage "https://github.com/AntoineCAU/check-updates"
  url "https://github.com/AntoineCAU/check-updates/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "5e4d39294d42ef21c55c7970c252d6dfb3c88a6560fa0b48b3f9f88494ac938c"
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
