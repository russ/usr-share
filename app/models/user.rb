class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :admin
  has_one :member
  
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
  
  acts_as_voter
  
  def member?
    self.member.try(:active?) ? true : false
  end
  
end
