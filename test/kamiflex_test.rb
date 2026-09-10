require_relative 'test_helper'
class KamiflexTest < Minitest::Test
  def message(context = nil, value = 'hello')
    Kamiflex.hash(context) { bubble { body { text value } } }
  end

  def test_hash_and_json_preserve_unescaped_text
    value = '<tag> & "quoted" 中文'
    result = message(nil, value)
    assert_equal value, result.dig(:contents, :body, :contents, 0, :text)
    json = Kamiflex.build { bubble { body { text value } } }
    assert_equal value, JSON.parse(json).dig('contents', 'body', 'contents', 0, 'text')
    assert_equal '1.0.0', Kamiflex::VERSION
  end

  def test_caller_class_and_instance_are_not_mutated
    context = Object.new
    before_ancestors = Object.ancestors.dup
    before_variables = context.instance_variables.dup
    message(context)
    assert_equal before_ancestors, Object.ancestors
    assert_equal before_variables, context.instance_variables
    refute Object.new.respond_to?(:bubble)
    refute context.respond_to?(:flex)
  end

  def test_context_public_helpers_with_keywords
    context = Class.new do
      def greeting(name:, punctuation: '!')
        "Hello #{name}#{punctuation}"
      end
      private
      def secret
        'not public'
      end
    end.new
    result = Kamiflex.hash(context) { bubble { body { text greeting(name: 'friend') } } }
    assert_equal 'Hello friend!', result.dig(:contents, :body, :contents, 0, :text)
    assert_raises(NameError) { Kamiflex.hash(context) { secret } }
  end

  def test_parallel_calls_using_same_context_are_isolated
    context = Object.new
    barrier = Queue.new
    threads = 20.times.map do |index|
      Thread.new do
        barrier.pop
        message(context, index.to_s)
      end
    end
    20.times { barrier << true }
    assert_equal 20.times.map(&:to_s), threads.map(&:value).map { |value| value.dig(:contents, :body, :contents, 0, :text) }
    assert_empty context.instance_variables
  end

  def test_nested_builds_and_exceptions_do_not_leak_state
    nested = nil
    result = Kamiflex.hash do
      bubble do
        body do
          text 'before'
          nested = Kamiflex.hash { bubble { body { text 'inner' } } }
          text 'after'
        end
      end
    end
    assert_equal %w[before after], result.dig(:contents, :body, :contents).map { |item| item[:text] }
    assert_equal 'inner', nested.dig(:contents, :body, :contents, 0, :text)
    assert_raises(RuntimeError) { Kamiflex.hash { bubble { raise 'interrupted' } } }
    assert_equal 'hello', message.dig(:contents, :body, :contents, 0, :text)
    assert_raises(ArgumentError) { Kamiflex.hash }
  end
end
