class User < ApplicationRecord
  acts_as_paranoid

  before_validation :set_initials

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  def self.icon
    'fa-user'
  end

  def set_initials
    self.initials ||= self.name.split.map{|n| n[0].capitalize}.join('')
  end

  def as_json(options = nil)
    super({ methods: [
      # include other methods here
    ]}.merge(options || {}))
  end

end
