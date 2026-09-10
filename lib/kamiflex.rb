# frozen_string_literal: true
require 'json'
require_relative 'kamiflex/version'
require_relative 'kamiflex/core'
require_relative 'kamiflex/basic_elements'
require_relative 'kamiflex/actions'
require_relative 'kamiflex/quick_reply'
require_relative 'kamiflex/custom'
require_relative 'kamiflex/builder'

module Kamiflex
  class << self
    # Every call owns its state. The optional context supplies public helpers only;
    # neither its class nor its instance variables are modified or copied.
    def hash(context = nil, &block)
      raise ArgumentError, 'a builder block is required' unless block
      Builder.new(context: context).render(&block)
    end
    alias to_hash hash

    def build(context = nil, &block)
      JSON.pretty_generate(hash(context, &block))
    end
    alias json build

    def compact_json(context = nil, &block)
      JSON.generate(hash(context, &block))
    end
  end
end

require_relative 'kamiflex/railtie' if defined?(Rails::Railtie)
