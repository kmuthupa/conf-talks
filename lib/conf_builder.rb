####
## Main Conference Builder module
## Run method processes the list of talks to build conference tracks
####

require 'version'
require 'talk'
require 'lightning_talk'
require 'thirty_min_talk'
require 'fortyfive_min_talk'
require 'sixty_min_talk'
require 'track'
require 'talk_factory'

module ConfBuilder

  def self.start(*args)
    run
  end

  def self.run
    begin
      list = YAML.load(File.open('talks.yml'))
      @@thirty_min_talks = []
      @@fortyfive_min_talks = []
      @@sixty_min_talks = []
      @@lightning_talks = []
      @@talk_factory = build_talk_factory(list)
      @@track1 = Track.new(@@talk_factory)
      @@track2 = Track.new(@@talk_factory)
      print
    rescue Exception => ex
      p "The conference builder program failed to complete successfully. Reason: #{ex.message}"
    end
  end

  private

  def self.build_talk_factory(list)
    lightning_list = list.map {|l| l if l.include?('lightning')}.compact!
    (list - lightning_list).each do |talk|
      duration = talk.gsub!('min', '').match(/a*\d\d$/).to_s
      title = talk.gsub!(duration, '').strip!
      case duration
      when '30'
        @@thirty_min_talks << Thirty_min_talk.new({:title => title})
      when '45'
        @@fortyfive_min_talks << Fortyfive_min_talk.new({:title => title})
      when '60'
        @@sixty_min_talks << Sixty_min_talk.new({:title => title})
      else
        p "#{title} talk excluded because duration was not acceptable"
      end
    end
    lightning_list.each do |talk|
      title = talk.gsub!('lightning', '')
      @@lightning_talks << Lightning_talk.new({:title => title})
    end
    TalkFactory.new(@@lightning_talks, @@thirty_min_talks, @@fortyfive_min_talks, @@sixty_min_talks) 
  end

  def self.print
    p '#### Conference talk list #####'
    p '#### Track 1 ####'
    @@track1.print
    p '#### Track 2 ####'
    @@track2.print
  end
end
