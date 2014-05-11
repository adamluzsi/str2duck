# coding: utf-8

### Specification for the new Gem
Gem::Specification.new do |spec|

  spec.name          = "str2duck"
  spec.version       = File.open(File.join(File.dirname(__FILE__),"VERSION")).read.split("\n")[0].chomp.gsub(' ','')
  spec.authors       = ["Adam Luzsi"]
  spec.email         = ["adamluzsi@gmail.com"]
  spec.description   = %q{ Parse string into obj }
  spec.summary       = %q{ String to Obj, Duck type parser }

  spec.homepage      = "https://github.com/adamluzsi/#{__FILE__.split(File::Separator.last.split('.').first)}"
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  #spec.add_dependency 'active_support'

end
