class Portfolio < ApplicationRecord
  
  ## The following is a parent/child relationship, it was created with on the terminal using the following: rails g model Technologies name:string portfolio:references

  has_many :technologies

  ## The following allows us to create a single portfolio item with multiple technologies. On the console write: Portfolio.create!(name: 'sdsds', subtitle: 'dfasdaf', technologies_attributes: [{name: 'Ruby on Rails'}, {name: 'Angular'}, {name: 'Ionic'}]) 

  accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }
  
  ## The following line includes Placeholder concern

  include Placeholder
  
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: "Angular")
  end

  ## Customs scopes serve as query runners

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  ## Now you can treat ruby_on_rails_portfolio_items as a method to query Ruby on Rails subtitiled itmes

  ## Implement a callback to set defaults

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end

  ## the '||=' operator means if there was nothing before, write the next value

end
