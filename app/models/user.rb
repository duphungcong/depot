class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password

  def is_admin
    return self.admin_enabled
  end

end
