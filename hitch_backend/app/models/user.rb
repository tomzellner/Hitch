class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        has_many :cars

        has_many :drivers, through: :driver_trips, source: :driver
         ##VVV not sure below
        has_many :driver_trips, foreign_key: :rider_id, class_name :'TripPassenger'

        has_many :passengers, through: :
end
