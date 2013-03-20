####
## Sub class for 60 min talk
####

module ConfBuilder
  class Sixty_min_talk < Talk
    def initialize(params)
      super(params)
      @duration = 60
      @duration_unit = 'minute'
      self
    end
  end
end
