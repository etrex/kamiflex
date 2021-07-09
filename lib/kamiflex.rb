require "json"
require_relative "./kamiflex/version"
require_relative "./kamiflex/core"
require_relative "./kamiflex/basic_elements"
require_relative "./kamiflex/actions"
require_relative "./kamiflex/quick_reply"
require_relative "./kamiflex/custom"

module Kamiflex
  def self.hash(parent, &block)
    parent.class.include Kamiflex::Core
    parent.class.include Kamiflex::BasicElements
    parent.class.include Kamiflex::Actions
    parent.class.include Kamiflex::QuickReply
    parent.class.include Kamiflex::Custom

    parent.instance_exec do
      flex do
        parent.instance_exec(&block)
      end
    end
  end

  def self.to_hash(parent, &block)
    self.hash(parent, &block)
  end

  def self.build(parent, &block)
    JSON.pretty_generate self.hash(parent, &block)
  end

  def self.json(parent, &block)
    self.build(parent, &block)
  end

  def self.compact_json(parent, &block)
    self.to_hash(parent, &block).to_json
  end
end

Mime::Type.register_alias "application/json", :line if defined?(Rails)
require_relative "./kamiflex/railtie" if defined?(Rails)