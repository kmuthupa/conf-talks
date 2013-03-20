require 'minitest_helper'
require_relative '../lib/lightning_talk'

describe ConfBuilder::Lightning_talk, 'Test the lightning talk class' do
  before do
    @lighting_talk = ConfBuilder::Lightning_talk.new({:title => 'Rails for Python Developers'})
  end

  after do
    @lighting_talk = nil
  end

  describe 'when initialized' do
    it 'should assign a title' do
      @lighting_talk.title.wont_equal nil
      @lighting_talk.title.must_equal 'Rails for Python Developers'
    end 

    it 'should assign a speaker' do
      @lighting_talk.speaker.wont_equal nil
    end

    it 'should assign the duration and duration unit' do
      @lighting_talk.duration.wont_equal nil
      @lighting_talk.duration.must_equal 5
      @lighting_talk.duration_unit.wont_equal nil
      @lighting_talk.duration_unit.must_equal 'minute'
    end
  end

  describe 'when translated to string' do
    it 'should produce the correct content' do
      @lighting_talk.to_s.wont_equal nil
      @lighting_talk.to_s.must_equal 'Rails for Python Developers lightning'
    end
  end
end
