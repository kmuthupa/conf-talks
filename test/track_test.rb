require 'minitest_helper'
require_relative '../lib/track'

describe ConfBuilder::Track, 'Test the Talk class' do
  before do
    @talk1 = ConfBuilder::Thirty_min_talk.new({:title => 'Write fast tests against Rails enterprise'})
    @talk2 = ConfBuilder::Fortyfive_min_talk.new({:title => 'Overdoing in Python'})
    @talk3 = ConfBuilder::Sixty_min_talk.new({:title => 'User interface CSS in Rails apps'})
    @talk4 = ConfBuilder::Lightning_talk.new({:title => 'Domain driven design in Rails apps'})
    @talk5 = ConfBuilder::Thirty_min_talk.new({:title => 'Object design in Ruby apps'})
    @talk6 = ConfBuilder::Sixty_min_talk.new({:title => 'Engineering principles'}) 
    @talk7 = ConfBuilder::Sixty_min_talk.new({:title => 'User driven design in Rails apps'})
    @talk8 = ConfBuilder::Fortyfive_min_talk.new({:title => 'Overdoing in Django'})
    @talk9 = ConfBuilder::Fortyfive_min_talk.new({:title => 'Agile in Django'})
    @talk10 = ConfBuilder::Sixty_min_talk.new({:title => 'UI Design in Django'})
    @talk11 = ConfBuilder::Sixty_min_talk.new({:title => 'TDD in Django'})
    @talk_factory = ConfBuilder::TalkFactory.new([@talk4], [@talk1, @talk5], [@talk2, @talk8, @talk9], [@talk3, @talk6, @talk7, @talk10, @talk11])
    @track = ConfBuilder::Track.new(@talk_factory)
  end

  after do
    @track = nil
    @talk1 = nil
    @talk2 = nil
    @talk3 = nil
    @talk4 = nil
    @talk5 = nil
    @talk6 = nil
    @talk7 = nil
    @talk8 = nil
    @talk9 = nil
    @talk10 = nil
    @talk11 = nil
  end

  describe 'when initialized' do
    it 'should not be nil' do
      @track.wont_equal nil
    end 
  end

  describe 'when talks for session' do
    it 'should build talks list for pre lunch session' do
      @track.pre_lunch_talks.wont_equal nil
      @track.pre_lunch_talks.wont_equal []
      @track.pre_lunch_talks.inspect.must_equal '[TDD in Django 60min, UI Design in Django 60min, User driven design in Rails apps 60min]'
    end

    it 'should build talks list for post lunch session' do
      @track.post_lunch_talks.wont_equal nil
      @track.post_lunch_talks.wont_equal []
      @track.post_lunch_talks.inspect.must_equal '[Engineering principles 60min, User interface CSS in Rails apps 60min, Agile in Django 45min, Overdoing in Django 45min, Object design in Ruby apps 30min]'
    end
  end

  describe 'print talks for session' do
    it 'should print lunch' do
      @track.lunch.must_include 'Lunch'
    end

    it 'should print networking event' do
      @track.networking_event.must_include 'Networking event'
    end

    it 'should list talks for the entire session' do
      @track.print
    end
  end
end
