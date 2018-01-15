class Picture < ApplicationRecord

  validates :artist, :title, :url, presence: true

  def self.recent
    Picture.where("created_at > ?", 1.month.ago)
  end

  def self.older
    Picture.where("created_at < ?", 1.month.ago)
  end

  def self.all_years_array
    years = []
    Picture.all.each do |picture|
      years << picture.created_at.year
    end
    years.uniq.sort.reverse
  end

  def self.pictures_by_year(year)
    pictures = []
    Picture.all.each do |picture|
      if picture.created_at.year == year
        pictures << picture
      end
    end
    pictures
  end

end
