require 'minitest_helper'
require_relative '../lib/conf_builder'

describe ConfBuilder, 'Test the Conference builder module' do
  it 'should run and create talks for tracks' do
    ConfBuilder.run
  end 
end
