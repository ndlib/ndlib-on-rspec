RSpec::Matchers.define :have_method do |method_name|
  match do |object|
    @method_name = method_name
    @arity ||= '0'.to_i
    if %r{^(\.|\#)(.*)} =~ method_name.to_s
      prefix = $1
      normalized_method_name = $2
      @normalized_method_name = normalized_method_name
      @klass = object.is_a?(Class) ? object : object.class
      if prefix == '.'
        @klass.method(@normalized_method_name).arity == @arity
      elsif prefix == '#'
        @klass.instance_method(@normalized_method_name).arity == @arity
      end
    else
      @method_name = "##{method_name}"
      @klass = object.class
      @normalized_method_name = method_name
      @object = object
      @object.method(@normalized_method_name).arity == @arity
    end
  end

  description do
    "have_method #{@method_name} [arity:#{@arity}]"
  end

  failure_message_for_should do |text|
    "expected #{@klass} to have_method #{@method_name} [arity:#{@arity}]"
  end

  failure_message_for_should_not do |text|
    "expected #{@klass} not to delegate #{@method_name} [arity:#{@arity}]"
  end

  chain(:with_arity) { |arity| @arity = arity }
end