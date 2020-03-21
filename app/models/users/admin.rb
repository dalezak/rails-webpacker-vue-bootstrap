class Admin < User
 
  def self.icon
    'fa-user-shield'
  end

  def self.model_name
    User.model_name
  end

end 