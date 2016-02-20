class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.persisted?
      can [:manage, :read], Word, user_id: user.id
      can :new, :practice
    else
      can :read, :welcome
    end
  end
end
