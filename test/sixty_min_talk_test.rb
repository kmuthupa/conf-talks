require 'minitest_helper'
require_relative '../lib/talk'
require_relative '../lib/sixty_min_talk'

describe ConfBuilder::Sixty_min_talk, 'Test the 60 minute talk class' do
  before do
    @talk_60 = ConfBuilder::Sixty_min_talk.new({:title => 'Ruby Errors from Mismatched Gem Versions'})
  end

  after do
    @talk_60 = nil
  end

  describe 'when initialized' do
    it 'should assign a title' do
      @talk_60.title.wont_equal nil
      @talk_60.title.must_equal 'Ruby Errors from Mismatched Gem Versions'
    end 

    it 'should assign a speaker' do
      @talk_60.speaker.wont_equal nil
    end

    it 'should assign the duration and duration unit' do
      @talk_60.duration.wont_equal nil
      @talk_60.duration.must_equal 60
      @talk_60.duration_unit.wont_equal nil
      @talk_60.duration_unit.must_equal 'minute'
    end
  end

  describe 'when translated to string' do
    it 'should produce the correct content' do
      @talk_60.to_s.wont_equal nil
      @talk_60.to_s.must_equal 'Ruby Errors from Mismatched Gem Versions 60min'
    end
  end
end
