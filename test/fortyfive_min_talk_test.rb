require 'minitest_helper'
require_relative '../lib/talk'
require_relative '../lib/fortyfive_min_talk'

describe ConfBuilder::Fortyfive_min_talk, 'Test the 45 minute talk class' do
  before do
    @talk_45 = ConfBuilder::Fortyfive_min_talk.new({:title => 'Ruby Errors from Mismatched Gem Versions'})
  end

  after do
    @talk_45 = nil
  end

  describe 'when initialized' do
    it 'should assign a title' do
      @talk_45.title.wont_equal nil
      @talk_45.title.must_equal 'Ruby Errors from Mismatched Gem Versions'
    end 

    it 'should assign a speaker' do
      @talk_45.speaker.wont_equal nil
    end

    it 'should assign the duration and duration unit' do
      @talk_45.duration.wont_equal nil
      @talk_45.duration.must_equal 45
      @talk_45.duration_unit.wont_equal nil
      @talk_45.duration_unit.must_equal 'minute'
    end
  end
  
  describe 'when translated to string' do
    it 'should produce the correct content' do
      @talk_45.to_s.wont_equal nil
      @talk_45.to_s.must_equal 'Ruby Errors from Mismatched Gem Versions 45min'
    end
  end
end
