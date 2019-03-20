require "kamiflex/railtie"
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