class Performance < ActiveRecord::Base
	belongs_to :player, :foreign_key => "player"
end
