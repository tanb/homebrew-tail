require "formula"

class Leanify < Formula
  homepage 'https://github.com/JayXon/Leanify'
  url 'https://github.com/JayXon/Leanify/archive/v0.4.2.tar.gz'
  version '0.4.2'
  sha1 '6a13973fdb056fd917779ecef53a2496aaf8d4ab'
  head 'https://github.com/JayXon/Leanify.git'

  def install
    system "make"
    bin.install "leanify"
  end
end
