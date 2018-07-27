## Concerns are like helpers for the model

module Placeholder
  extend ActiveSupport::Concern

## The following method is used to set portfolio defaults 

  def self.image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end
  
end

