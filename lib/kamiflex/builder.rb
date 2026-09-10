# frozen_string_literal: true
module Kamiflex
  class Builder
    include Core
    include BasicElements
    include Actions
    include QuickReply
    include Custom

    def initialize(context: nil)
      @context = context
    end

    def render(&block)
      raise ArgumentError, 'a builder block is required' unless block
      flex { instance_exec(&block) }
    end

    private

    def method_missing(name, *args, **kwargs, &block)
      return @context.public_send(name, *args, **kwargs, &block) if @context && @context.respond_to?(name)
      super
    end

    def respond_to_missing?(name, include_private = false)
      (@context && @context.respond_to?(name)) || super
    end
  end
end
