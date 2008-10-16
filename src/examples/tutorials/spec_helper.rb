[File.dirname(__FILE__), "#{File.dirname(__FILE__)}/.."].each {|dir| $:.unshift(dir) }
require "poolparty"

include PoolParty::Resources