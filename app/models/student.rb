class Student < ApplicationRecord

  has_many :reservations
  has_many :rooms, :through => :reservations
  has_many :answers

  acts_as_user :roles => [:admin, :thirdpart]

  ROLES = %i[admin student thirdpart]

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]

  def self.find_for_facebook(auth_hash)
    user = Student.where(:email => auth_hash.info["email"]).first

    unless user
      user = Student.create(
        name: auth_hash.info["nickname"],
        email: auth_hash.info["email"],
        password: Devise.friendly_token[0,20])
    end

    user.provider = auth_hash["provider"]
    user.uid = auth_hash["uid"]
    user
  end

  def self.from_omniauth(omniauth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |student|
      student.email = auth.info.email
      student.password = Devise.friendly_token[0,20]
    end
  end 

  def self.new_with_session(params, session)
     super.tap do |student|
       if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
         student.email = data["email"] if student.email.blank?
       end 
     end
  end 
 
end
