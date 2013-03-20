require 'minitest_helper'
require_relative '../lib/talk_factory'

describe ConfBuilder::TalkFactory, 'test the Talk factory class' do 
   before do
    @talk1 = ConfBuilder::Thirty_min_talk.new({:title => 'Write fast tests against Rails enterprise'})
    @talk5 = ConfBuilder::Thirty_min_talk.new({:title => 'Object design in Ruby apps'})
    @talk2 = ConfBuilder::Fortyfive_min_talk.new({:title => 'Overdoing in Python'})
    @talk8 = ConfBuilder::Fortyfive_min_talk.new({:title => 'Overdoing in Django'})
    @talk3 = ConfBuilder::Sixty_min_talk.new({:title => 'User interface CSS in Rails apps'})
    @talk6 = ConfBuilder::Sixty_min_talk.new({:title => 'Engineering principles'}) 
    @talk7 = ConfBuilder::Sixty_min_talk.new({:title => 'Domain driven design in Rails apps'})
    @talk4 = ConfBuilder::Lightning_talk.new({:title => 'Domain driven design in Rails apps'})
    @talk_factory = ConfBuilder::TalkFactory.new([@talk4], [@talk1, @talk5], [@talk2, @talk8], [@talk3, @talk6, @talk7])
  end

  after do
    @talk_factory = nil
    @talk1 = nil
    @talk2 = nil
    @talk3 = nil
    @talk4 = nil
    @talk5 = nil
    @talk6 = nil
    @talk7 = nil
    @talk8 = nil
  end

  describe 'when initialized' do
    it 'should not be nil' do
      @talk_factory.wont_equal nil
    end 
  end

  describe 'when next talk is invoked' do
    it 'should get next talk for total duration of 90 minutes' do
      @talk_factory.next_talk(90).must_equal @talk7
      @talk_factory.next_talk(30).must_equal @talk5
    end

    it 'should get next talk for total duration of 120 minutes' do
      @talk_factory.next_talk(120).must_equal @talk7
      @talk_factory.next_talk(60).must_equal @talk6
    end

    it 'should get next talk for total duration of 20 minutes' do
      @talk_factory.next_talk(20).must_equal @talk4
      @talk_factory.next_talk(15).must_equal nil
    end
  end
end