class Trip < ActiveRecord::Base
	has_one :car
	


	belongs_to :driver, foreign_key: 'driver_id', class_name: "User"

	has_many :passengers, through: :riders, class_name: "User"
	has_many :riders





end


# /users

#/users/id/cars

#/users/id/ratings

#/trips



#messages???

