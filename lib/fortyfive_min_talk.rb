####
## Sub class for 45 min talk
####

module ConfBuilder
  class Fortyfive_min_talk < Talk
    def initialize(params)
      super(params)
      @duration = 45
      @duration_unit = 'minute'
      self
    end
  end
end
