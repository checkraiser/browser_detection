class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  def last_sign_in_time
    vn = TZInfo::Country.get('VN')
    zone = vn.zone_identifiers.sample
    TZInfo::Timezone.get(zone).utc_to_local(self.last_sign_in_at)
  end
end
