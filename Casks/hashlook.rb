class Hashlook < Cask
  homepage 'https://github.com/tanb/HashLook'
  url 'https://github.com/tanb/HashLook-Preview/releases/download/0.1.0/HashLook-0.1.0.zip'
  version '0.1.0'
  sha256 '752f36862b441cda16fa7d438f1773c377940738b5e9b916da7eb3d7c915f040'

  depends_on :macos => :mavericks

  app 'HashLook.app'
end
