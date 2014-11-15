require "formula"

class Cider < Formula
  homepage 'https://github.com/msanders/cider'
  url 'https://github.com/msanders/cider/archive/v1.1.3.tar.gz'
  version '1.1.3'
  sha1 '7de7b0437d0e0ce3a364bebcb34d07dbe12b75fb'
  head 'https://github.com/msanders/cider.git'

  depends_on :python => :recommended
  depends_on "click"
  depends_on "rfc3987"
  
  def install
    # https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Homebrew-and-Python.md#if-the-software-provides-a-setuppy
    Language::Python.each_python(build) do |python, version|
      system python, "setup.py", "install", "--prefix=#{prefix}", "--single-version-externally-managed", "--record=installed.txt"
    end
  end
end
