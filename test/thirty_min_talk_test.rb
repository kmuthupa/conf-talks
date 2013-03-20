require 'minitest_helper'
require_relative '../lib/thirty_min_talk'

describe ConfBuilder::Thirty_min_talk, 'Test the 30 minute talk class' do
  before do
    @talk_30 = ConfBuilder::Thirty_min_talk.new({:title => 'Ruby Errors from Mismatched Gem Versions'})
  end

  after do
    @talk_30 = nil
  end

  describe 'when initialized' do
    it 'should assign a title' do
      @talk_30.title.wont_equal nil
      @talk_30.title.must_equal 'Ruby Errors from Mismatched Gem Versions'
    end 

    it 'should assign a speaker' do
      @talk_30.speaker.wont_equal nil
    end

    it 'should assign the duration and duration unit' do
      @talk_30.duration.wont_equal nil
      @talk_30.duration.must_equal 30
      @talk_30.duration_unit.wont_equal nil
      @talk_30.duration_unit.must_equal 'minute'
    end
  end

  describe 'when translated to string' do
    it 'should produce the correct content' do
      @talk_30.to_s.wont_equal nil
      @talk_30.to_s.must_equal 'Ruby Errors from Mismatched Gem Versions 30min'
    end
  end
end
