require './lib/shopmart/version'
Gem::Specification.new do |s|
  s.name        = 'shopmart'
  s.version     = Shopmart::VERSION
  s.date        = '2015-12-28'
  s.summary     = "Shopping Inventory"
  s.description = "Shopping Inventory : Has two users shopkeepr and customer"
  s.authors     = ["Deepak Kabbur"]
  s.email       = 'deepak.kabbur@weboniselab.com'
  s.files       = Dir['lib/ *.rb'] + Dir['bin/*']
  s.require_path = ['lib']
  s.bindir = 'bin'
  s.executables << 'shopmart'
  s.homepage    =
    'http://rubygems.org/gems/shopmart'
  s.license       = 'MIT'
  s.post_install_message = "Thank You for installing"
end
