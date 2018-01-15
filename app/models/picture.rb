class Picture < ApplicationRecord

  def self.recent
    Picture.where("created_at > ?", 1.month.ago)
  end

  def self.older
    Picture.where("created_at < ?", 1.month.ago)    
  end

end
