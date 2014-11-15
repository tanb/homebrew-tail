require "formula"

class Click < Formula
  homepage 'http://click.pocoo.org/'
  url 'https://github.com/mitsuhiko/click/archive/3.3.tar.gz'
  version '3.3'
  sha1 'c6988244cef66666874f291b4439d4ad0ae254ef'
  head 'https://github.com/mitsuhiko/click.git'

  depends_on :python => :recommended
  
  def install
    # https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Homebrew-and-Python.md#if-the-software-provides-a-setuppy
    Language::Python.each_python(build) do |python, version|
      system python, "setup.py", "install", "--prefix=#{prefix}",  "--single-version-externally-managed", "--record=installed.txt"
    end
  end
end
