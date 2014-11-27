cask :v1 => 'deploymate' do
  homepage 'http://www.deploymateapp.com'
  url 'https://s3.amazonaws.com/deploymate/download/Deploymate127.zip'
  version '1.2.7'
  sha256 'f0f8aed76ab3dacb38ca1aead71708a3fa5c112e22115368e999a68d9efbb29c'

  depends_on :macos => :lion # Requires Mac OS X 10.7 or later

  app 'Deploymate.app'
end
