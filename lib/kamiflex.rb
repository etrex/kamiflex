require "json"
require_relative "./kamiflex/core"
require_relative "./kamiflex/basic_elements"
require_relative "./kamiflex/actions"
require_relative "./kamiflex/quick_reply"
require_relative "./kamiflex/custom"

module Kamiflex
  def self.to_hash(parent)
    parent.class.include Kamiflex::Core
    parent.class.include Kamiflex::BasicElements
    parent.class.include Kamiflex::Actions
    parent.class.include Kamiflex::QuickReply
    parent.class.include Kamiflex::Custom

    parent.instance_exec do
      flex do
        yield
      end
    end
  end

  def self.build(parent)
    parent.class.include Kamiflex::Core
    parent.class.include Kamiflex::BasicElements
    parent.class.include Kamiflex::Actions
    parent.class.include Kamiflex::QuickReply
    parent.class.include Kamiflex::Custom

    hash = parent.instance_exec do
      flex do
        yield
      end
    end
    JSON.pretty_generate hash
  end
end

Mime::Type.register_alias "application/json", :line if defined?(Rails)
require_relative "./kamiflex/railtie" if defined?(Rails)