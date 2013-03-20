require 'minitest_helper'
require_relative '../lib/talk'

describe ConfBuilder::Talk, 'Test the Talk class' do
  before do
    @talk = ConfBuilder::Talk.new({:title => 'Overdoing it in Python'})
  end

  after do
    @talk = nil
  end

  describe 'when initialized' do
    it 'should assign a title' do
      @talk.speaker.wont_equal nil
      @talk.title.must_equal 'Overdoing it in Python'
    end 

    it 'should assign a speaker' do
      @talk.speaker.wont_equal nil
    end
  end
end
