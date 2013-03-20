####
## Class to collate list of talks for a track
## Prelunch session and post lunch session
####

module ConfBuilder
  class Track
    attr_reader :pre_lunch_talks
    attr_reader :post_lunch_talks

    def initialize(talk_factory)
      @track_time = Time.local(2000,"jan",1,9,0,0) #start time - 9:00 AM
      @talk_factory = talk_factory
      @pre_lunch_talks = []
      @post_lunch_talks = []
      build_session(@pre_lunch_talks, 180)
      build_session(@post_lunch_talks, 240)
      self
    end
    
    def build_session(session, duration)
      while duration > 0
        talk_to_add = @talk_factory.next_talk(duration)
        unless talk_to_add.nil?
          session << talk_to_add
          duration -= talk_to_add.duration
        else
          break
        end
      end
    end

    def print # print talks for track
      talk_and_time_list(@pre_lunch_talks).each {|item| p item}
      lunch
      @track_time += 3600
      talk_and_time_list(@post_lunch_talks).each {|item| p item}
      networking_event
    end

    def lunch # print lunch 
      p "#{@track_time.strftime("%-l:%M %p")} Lunch"
    end

    def networking_event # print networking event
      p "#{@track_time.strftime("%-l:%M %p")} Networking event"
    end

    private

    def talk_and_time_list(talks)
      ret_list = []
      talks.map do |talk|
        ret_list << "#{@track_time.strftime("%-l:%M %p")} #{talk.to_s}"
        @track_time = @track_time + (talk.duration * 60)
      end
      ret_list
    end
  end
end
