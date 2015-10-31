class Rating < ActiveRecord::Base
  belongs_to :recipe

  def ratingAvg
    sum = 0.0
    ratings.each { |rating| sum += rating.rating }
    sum/ratings.length
  end

end
