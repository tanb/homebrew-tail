require "formula"

class Rfc3987 < Formula
  homepage 'https://github.com/dgerber/rfc3987'
  url 'https://pypi.python.org/packages/source/r/rfc3987/rfc3987-1.3.4.tar.gz'
  version '1.3.4'
  sha1 '3566375510b6e9f630a72ab83af06e29f17c4784'
  head 'https://github.com/dgerber/rfc3987.git'

  depends_on :python => :recommended
  
  def install
    # https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Homebrew-and-Python.md#if-the-software-provides-a-setuppy
    Language::Python.each_python(build) do |python, version|
      system python, "setup.py", "install", "--prefix=#{prefix}", "--record=installed.txt"
    end
  end
end
