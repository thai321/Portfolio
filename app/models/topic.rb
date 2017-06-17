class Topic < ApplicationRecord
  validates_presence_of :title
  has_many :blogs

  def self.with_blogs # bring me the topic that have blog
    includes(:blogs).where.not(blogs: {id: nil})
  end
end
