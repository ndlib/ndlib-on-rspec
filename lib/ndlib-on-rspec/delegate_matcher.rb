# RSpec matcher to spec delegations.

RSpec::Matchers.define :delegate do |method|
  match do |object|
    @method = method
    @via ||= method
    @object = object

    if !@object.respond_to?(@to)
      raise "#{@object} does not respond to ##{@to}!"
    end

    @object.stub(@to).and_return double('receiver')
    @object.send(@to).stub(@via).and_return :called
    @object.send(@method) == :called
  end

  description do
    "delegate ##{@method} to ##{@to}##{@via}"
  end

  failure_message_for_should do |text|
    "expected #{@object} to delegate ##{@method} to ##{@to}##{@via}"
  end

  failure_message_for_should_not do |text|
    "expected #{@object} not to delegate ##{@method} to ##{@to}##{@via}"
  end

  chain(:to) { |receiver| @to = receiver }
  chain(:via) { |via| @via = via }

end