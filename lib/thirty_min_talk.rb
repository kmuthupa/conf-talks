####
## Sub class for 30 min talk
####

module ConfBuilder
  class Thirty_min_talk < Talk
    def initialize(params)
      super(params)
      @duration = 30
      @duration_unit = 'minute'
      self
    end
  end
end
