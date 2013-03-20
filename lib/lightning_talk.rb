####
## Sub class for lightning talk
####

module ConfBuilder
  class Lightning_talk < Talk
    def initialize(params)
      super(params)
      @duration = 5
      @duration_unit = 'minute'
      self
    end

    def to_s
      "#{@title} lightning" 
    end
  end
end
