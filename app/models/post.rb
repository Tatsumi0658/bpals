class Post < ApplicationRecord
  validates :images, presence: true
  validates :content, length:{ maximum: 300 }
  mount_uploaders :images, VideoUploader
  has_many :post_hashtag_relationships, through: :post_hashtag_relationships, source: :hashtags
  belongs_to :profile
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_profiles, through: :favorites, source: :profile
  validates_integrity_of :images

  after_create do
    post = Post.find_by(id: self.id)
    unless self.content.nil?
      hashtags = self.content.scan(/#[\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
      hashtags.each do |hash|
        hash = hash.delete('#')
        hash_log = Hashtag.find_or_create_by(hashtag: hash)
        PostHashtagRelationship.create!(post_id: post.id, hashtag_id: hash_log.id)
      end
    end
  end

  scope :search_content, ->(word){ where('content LIKE ?', "#{word}")}


end
