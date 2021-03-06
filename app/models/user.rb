class User < ActiveRecord::Base

  has_many :venues
  has_many :reservations
  attr_accessible :provider, :uid, :name, :email, :first_name, :last_name, :age, :address, :city, :state, :country, :zip_code

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

end
