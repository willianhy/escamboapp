class Admin < ActiveRecord::Base
  rolify
  # Constants
  #ROLES  = {:full_access => 0, :restricted_access => 1}

  #Enums
  #enum role: {:full_access => 0, :restricted_access => 1}

  #scope :with_full_access, -> { where(role: ROLES[:full_access])}
  #scope :with_restricted_access, -> { where(role: ROLES[:restricted_access])}
  scope :with_restricted_access, -> { with_role(Role::OPTIONS[1]) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
