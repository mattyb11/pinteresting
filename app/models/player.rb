class Player < ActiveRecord::Base
	has_many :performances, :foreign_key => "player"
end
