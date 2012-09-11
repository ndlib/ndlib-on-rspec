require "spec_helper"

describe RSpec::Matchers, "have_method" do
  subject { Comment.new }

  describe '#have_method' do
    context 'without arity' do

      it 'handles have_method with instance method lookup' do
        subject.should have_method('#blog_name')
      end

      it 'handles have_method with instance method lookup' do
        subject.should have_method(:blog_name)
      end

      it 'handles have_method with class method' do
        subject.should have_method('.a_class_method_name')
      end

      it 'handles have_method with assumed instance method for class' do
        subject.class.should have_method(:a_class_method_name)
      end

      it 'handles have_method with explicit instance method for class' do
        subject.class.should have_method(".a_class_method_name")
      end

    end

    context 'with arity' do
      subject do
        Class.new do
          def method_with_one_param(one)
          end
          def method_with_splat_arg(*args)
          end
        end.new
      end
      it 'handles arity with explicit arg' do
        subject.should have_method("#method_with_one_param").with_arity(1)
      end
      it 'handles defined method with wrong arity' do
        lambda {
          subject.should have_method("#method_with_one_param").with_arity(2)
        }.should(
        raise_error(
          RSpec::Expectations::ExpectationNotMetError,
          %r{have_method \#method_with_one_param \[arity\:2\]}
        ))
      end
      it 'handles arity with splat args' do
        subject.should have_method("#method_with_splat_arg").with_arity(-1)
      end
    end
  end
end
