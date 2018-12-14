class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, User
    can :manage, Article
  end
end
