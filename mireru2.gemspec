# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mireru2/version'

Gem::Specification.new do |spec|
  spec.name          = "mireru2"
  spec.version       = Mireru2::VERSION
  spec.authors       = ["Masafumi Yokoyama"]
  spec.email         = ["myokoym@gmail.com"]
  spec.summary       = %q{Flexible File Viewer Keyboard Friend}
  spec.description   = %q{A file viewer with a focus on flexibility by Ruby/GTK2. A friend of a keyboard.}
  spec.homepage      = "https://github.com/myokoym/mireru2"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("gtk2")
  spec.add_runtime_dependency("gtksourceview2")
  # NOTE: Ruby/ClutterGTK is for Ruby/GTK3.
  #spec.add_runtime_dependency("clutter-gtk")
  #spec.add_runtime_dependency("clutter-gstreamer", "= 2.0.2")

  spec.add_development_dependency("test-unit")
  spec.add_development_dependency("test-unit-notify")
  spec.add_development_dependency("test-unit-rr")
  spec.add_development_dependency("bundler", "~> 1.3")
  spec.add_development_dependency("rake")
end
