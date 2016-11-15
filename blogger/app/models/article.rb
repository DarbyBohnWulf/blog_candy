class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  validates :title, :body, presence: true
  validates :title, length: { minimum: 8 }

  def tag_list
    tags.join ", "
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|tag| tag.strip.downcase}.uniq
    added_tags = tag_names.collect {|tag| Tag.find_or_create_by(name: tag)}
    self.tags = added_tags
  end
end
