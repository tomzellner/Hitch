class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        has_many :cars

        has_many :drivers, through: :driver_trips, source: :driver
         ##VVV not sure below
        has_many :driver_trips, foreign_key: :driver_id, class_name: 'Trip'

        has_many :passengers, through: :passenger_riders
        has_many :passenger_riders, foreign_key: :passenger_id, class_name: 'Rider'
end


#User.create!({:email => "guy@gmail.com",  :password => "12345678", :password_confirmation => "12345678" })