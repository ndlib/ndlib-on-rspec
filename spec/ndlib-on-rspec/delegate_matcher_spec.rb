require "spec_helper"

describe RSpec::Matchers, "delegate" do
  subject { Comment.new }

  describe '#delegate' do
    it 'handles general delegate' do
      subject.should delegate(:blog_name).to(:blog)
    end

    it 'handles general delegate with prefix' do
      subject.should delegate(:blog_size).to(:blog).via(:size)
    end

    it 'handles missing method on delegated from object' do
      lambda {
        subject.should delegate(:obviously_missing).to(:blog)
      }.should(
        raise_error(
          NameError,
          /undefined method `obviously_missing'/
        )
      )
    end

    it 'handles missing method on delegated to object' do
      lambda {
        subject.should delegate(:parent).to(:blog)
      }.should(
        raise_error(
          RSpec::Expectations::ExpectationNotMetError,
          /delegate #parent to #blog#parent/
        )
      )
    end

  end
end
