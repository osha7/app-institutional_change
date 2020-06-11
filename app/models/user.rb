
class User < ActiveRecord::Base

    has_secure_password

    validates_presence_of :email, :password, :first_name, :last_initial, :zip_code
    
    has_many :pledges
    has_many :posts

end
