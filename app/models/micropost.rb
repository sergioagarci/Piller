class Micropost < ActiveRecord::Base
  belongs_to :usuario
  default_scope -> { order('created_at DESC') }  
  validates :content, presence: true, length: { maximum: 140 }
  validates :categoria, presence: true
  validates :usuario_id, presence: true
end