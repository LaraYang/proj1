class Pokemon < ActiveRecord::Base
	belongs_to :trainer
	validates :name, :presence => {:message => "Give your pokemon a name!"}, :uniqueness => {:message => "Name should be unique!"} 
end
