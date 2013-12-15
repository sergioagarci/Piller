class Microvideo < ActiveRecord::Base
	#attr_accessible :content, :titulo , :comentario

	belongs_to :usuario
	default_scope -> { order('created_at DESC') }
	validates :usuario_id, presence: true

	url_regex = /\Ahttp:\/\/(?:www\.)?youtube.com\/watch\?(?=.*v=\w+)(?:\S+)?\z/

	validates :content, 	:presence => true, 
  							        :length => { maximum: 140 },
  							        :format  => { :with => url_regex }

  validates :titulo, 		:presence => true, 
  							        :length => { maximum: 100 }  						    
  validates :comentario, length: { maximum: 140 }
	
end
