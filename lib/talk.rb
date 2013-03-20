####
## Talk super class
####

module ConfBuilder
  class Talk
    attr_reader :title
    attr_accessor :duration
    attr_accessor :duration_unit
    attr_reader :speaker

    def initialize(params)
      @title = params[:title]
      @speaker = ['Uncle Bob Martin','Corey Haines','DHH'].sample
      self
    end

    def to_s
      "#{@title} #{@duration}#{duration_unit.slice(0, 3)}" 
    end
  end
end
