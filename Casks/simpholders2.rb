cask :v1 => 'simpholders2' do
  homepage 'http://simpholders.com'
  url 'http://simpholders.com/site/assets/files/1098/sp20a-87.zip'
  version '2.0a'
  sha256 '53c62d2a5817e0b7c3bb77b83dca74819ecee8e799ddc5a0832787a2456ed0a4'

  depends_on :macos => :yosemite # Needs at least Mac OS X "Yosemite" aka. 10.10.

  app 'SimPholders2.app'
end
