class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :read, :create, to: :read_create
    alias_action :read, :update, to: :read_update
    if user.nil?
      can :create, User
      can :forgot, User
    elsif user.is_a?(Admin)
      self.merge(AdminAbility.new(user))
    else 
      self.merge(UserAbility.new(user))
    end  
  end
end
