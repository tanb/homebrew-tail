require "formula"

class Gyp < Formula
  homepage 'https://code.google.com/p/gyp/'
  head 'https://chromium.googlesource.com/external/gyp.git'

  depends_on :python => :recommended
  
  def install
    # https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Homebrew-and-Python.md#if-the-software-provides-a-setuppy
    Language::Python.each_python(build) do |python, version|
      system python, "setup.py", "install", "--prefix=#{prefix}", "--single-version-externally-managed", "--record=installed.txt"
    end
  end
end
