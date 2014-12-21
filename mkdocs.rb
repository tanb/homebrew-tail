require "formula"

class Mkdocs < Formula
  homepage 'http://www.mkdocs.org/#getting-started'
  url 'https://github.com/tomchristie/mkdocs/archive/0.11.1.zip'
  version '0.11.1'
  sha1 'ff6b8289288ea9e86f12ce3cf9a4edb9390defbf'
  head 'https://github.com/tomchristie/mkdocs.git'
  
  depends_on :python => :recommended
  
  def install
    # https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Homebrew-and-Python.md#if-the-software-provides-a-setuppy
    Language::Python.each_python(build) do |python, version|
      system python, "setup.py", "install", "--prefix=#{prefix}", "--single-version-externally-managed", "--record=installed.txt"
    end
  end
end
