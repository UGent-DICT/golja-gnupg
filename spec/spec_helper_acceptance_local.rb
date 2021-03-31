# frozen_string_literal: true

require 'puppet_litmus'
require 'singleton'
require 'pathname'

class LitmusHelper
  include Singleton
  include PuppetLitmus
end

RSpec.configure do |c|
  c.formatter = :documentation
end

def gpg(gpg_cmd, options = { user: 'root' }, &block)
  user = options.delete(:user)
  gpg = "gpg #{gpg_cmd}"
  command("su #{user} -c \"#{gpg}\"", &block)
end

def transfer_file(file, destination)
  filepath = Pathname.new(file).absolute? ? file : File.expand_path(File.join(File.dirname(__FILE__), '..', file))
  content = File.read(filepath)
  write_file(content, destination)
end
