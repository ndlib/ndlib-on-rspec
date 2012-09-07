require "spec_helper"

describe RSpec::Matchers, "alias_from" do
  class Comment
    def parent
      @parent ||= Comment.new
    end
    alias_method :ancestor, :parent

    def level_up
      parent
    end

    def inspected_parent
      parent.inspect
    end
  end
  subject { Comment.new }

  describe '#alias_from' do
    it 'handles :alias_method' do
      subject.should alias_from(:parent).to(:ancestor)
    end

    it 'handles method definition' do
      subject.should alias_from(:parent).to(:level_up)
    end

    it 'handles alias receiver with modification' do
      lambda {
        subject.should alias_from(:parent).to(:inspected_parent)
      }.should(
        raise_error(
          RSpec::Expectations::ExpectationNotMetError,
          /alias :parent to :inspected_parent/
        )
      )
    end

    it 'handles missing method' do
      lambda {
        subject.should alias_from(:parent).to(:obviously_missing)
      }.should(
        raise_error(
          NameError,
          /undefined method `obviously_missing'/
        )
      )
    end
  end
end
