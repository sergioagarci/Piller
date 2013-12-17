class Micropost < ActiveRecord::Base
  belongs_to :usuario
  default_scope -> { order('created_at DESC') }  
  validates :content, presence: true, length: { maximum: 140 }
  validates :categoria, presence: true
  validates :usuario_id, presence: true


  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :usuario_id"
    where("usuario_id IN (#{followed_user_ids}) OR usuario_id = :usuario_id",
          usuario_id: user.id)
  end

end