class EmployeeAbility
  include CanCan::Ability

  def initialize(user)
    can :read, Step
  end

end
