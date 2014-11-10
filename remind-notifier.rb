require "formula"

class RemindNotifier < Formula
  homepage "https://github.com/tanB/remind-notifier"
  url "https://github.com/tanB/remind-notifier/archive/0.1.1.tar.gz"
  version '0.1.1'
  sha1 "8966e2e27d80c887172ff88110c4bcae9e907eda"
  head "https://github.com/tanB/remind-notifier.git"

  depends_on :macos => :yosemite # Needs at least Mac OS X "Yosemite" aka. 10.10.

  def install
    system "make"
    bin.install "remind-notifier"
  end

  test do
    system "#{bin}/remind-notifier", "-h"
  end
end
