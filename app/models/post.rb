class Post < ApplicationRecord
  validates :images, presence: true
  mount_uploaders :images, ImageUploader
  has_many :post_hashtag_relationships, through: :post_hashtag_relationships, source: :hashtags
  belongs_to :profile

  after_create do
    post = Post.find_by(id: self.id)
    hashtags = self.content.scan(/#[\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.each do |hash|
      hash = hash.delete('#')
      hash_log = Hashtag.find_or_create_by(hashtag: hash)
      PostHashtagRelationship.create!(post_id: post.id, hashtag_id: hash_log.id)
    end
  end
end
