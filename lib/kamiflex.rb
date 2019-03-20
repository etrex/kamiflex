require "json"
require "kamiflex/core"
require "kamiflex/basic_elements"
require "kamiflex/actions"
require "kamiflex/quick_reply"

module Kamiflex
  def self.build(parent)
    parent.class.include Kamiflex::Core
    parent.class.include Kamiflex::BasicElements
    parent.class.include Kamiflex::Actions
    parent.class.include Kamiflex::QuickReply
    JSON.pretty_generate yield
  end
end

Mime::Type.register "application/json", :line if defined?(Rails)
require "kamiflex/railtie" if defined?(Rails)