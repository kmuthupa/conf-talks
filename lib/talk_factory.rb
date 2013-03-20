module ConfBuilder
  class TalkFactory
    def initialize(lightning_talks, thirty_min_talks, fortyfive_min_talks, sixty_min_talks)
      @lightning_talks = lightning_talks
      @thirty_min_talks = thirty_min_talks
      @fortyfive_min_talks = fortyfive_min_talks
      @sixty_min_talks = sixty_min_talks
      self
    end

    def next_talk(duration)
      if !@sixty_min_talks.empty? && (@sixty_min_talks.last.duration <= duration)
        @sixty_min_talks.pop
      elsif !@fortyfive_min_talks.empty? && (@fortyfive_min_talks.last.duration <= duration)
        @fortyfive_min_talks.pop
      elsif !@thirty_min_talks.empty? && (@thirty_min_talks.last.duration <= duration)
        @thirty_min_talks.pop
      elsif !@lightning_talks.empty?
        @lightning_talks.pop
      end
    end
  end
end
