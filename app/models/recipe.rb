class Recipe < ActiveRecord::Base
  validates :title, :presence => true
  validates :author, :presence => true
  validates :ingredients, :presence => true
  validates :instructions, :presence => true

  has_many :tags
  has_many :ratings

  def self.all_sorted_by_ratings
    Recipe.all.order("-average_rating asc")
  end

end
