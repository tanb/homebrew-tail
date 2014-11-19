class Hashlook < Cask
  homepage 'https://github.com/tanb/HashLook'
  url 'https://github.com/tanb/HashLook/releases/download/0.1.0/HashLook.zip'
  version '0.1.0'
  sha256 'bd8552b9b6c8b815b24ec5ec0fe65f5c633420836985401da63987dc07c30c7b'

  depends_on :macos => :mavericks

  app 'HashLook.app'
end
