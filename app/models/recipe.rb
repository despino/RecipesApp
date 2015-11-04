class Recipe < ActiveRecord::Base
  validates :title, :presence => true
  validates :author, :presence => true
  validates :ingredients, :presence => true
  validates :instructions, :presence => true

  has_many :tags
  has_many :ratings

  has_attached_file :image, styles: { small: "64x64", medium: "100x100", large: "200x200" }
  # validates_attachment :image, presence: true,
  #   content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
  #   size: { in: 0..10.megabytes }

  def self.all_sorted_by_ratings
    Recipe.all.order("-average_rating asc")
  end

  def self.get_random_unrated_recipe_or_random_recipe
    recipesNotRated = Recipe.where(:average_rating => nil)
    if recipesNotRated.empty?
      Recipe.all.sample
    else
      recipesNotRated.sample
    end
  end

end
