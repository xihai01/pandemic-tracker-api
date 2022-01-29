class Admin < ActiveRecord::Base
  has_secure_password


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { in: 3..20 }
  validates :email, :uniqueness => {:case_sensitive => false}

  def self.authenticate_with_credentials(email,password)
    self.where('trim(lower(email)) = ?', email.downcase.strip).first&.authenticate(password)
  end

end
