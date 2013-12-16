class Micropost < ActiveRecord::Base
  belongs_to :usuario
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :usuario_id, presence: true

  # Returns microposts from the usuarios being followed by the given usuario.
  def self.from_usuarios_followed_by(usuario)
    followed_usuario_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :usuario_id"
    where("usuario_id IN (#{followed_usuario_ids}) OR usuario_id = :usuario_id",
          usuario_id: usuario.id)
  end
end