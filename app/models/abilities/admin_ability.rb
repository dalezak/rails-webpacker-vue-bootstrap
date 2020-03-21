class AdminAbility
  include CanCan::Ability

  def initialize(user)
      can :manage, User
      can :manage, Step
  end

end
