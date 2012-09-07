# RSpec matcher to spec alias.
RSpec::Matchers.define :alias_from do |method_name|
  match do |object|
    @method_name = method_name
    @object = object
    if !@object.respond_to?(@method_name)
      raise "#{@object} does not respond to ##{@method_name}!"
    end

    # If :alias_method was used
    returning_value = (@object.method(@to) == @object.method(@method_name))

    # Try something comparing return values
    if !returning_value
      @from_returned_value = double('receiver')
      @object.stub(@method_name).and_return(@from_returned_value)
      returning_value = (@object.send(@to) == @from_returned_value)
    end

    returning_value
  end

  description do
    "alias ##{@method_name} to ##{@to}"
  end

  failure_message_for_should do |text|
    "expected #{@object} to alias ##{@method_name} to ##{@to}"
  end

  failure_message_for_should_not do |text|
    "expected #{@object} NOT to alias ##{@method_name} to ##{@to}"
  end

  chain(:to) { |receiver| @to = receiver }
end
