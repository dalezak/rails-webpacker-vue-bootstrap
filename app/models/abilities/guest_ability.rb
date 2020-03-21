class GuestAbility
  include CanCan::Ability

  def initialize(user)
    can :create, User
    can :read, Step
  end

end
