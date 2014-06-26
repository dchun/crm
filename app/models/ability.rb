class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 'Master'
      can :manage, :all
    elsif user.role == 'Contact Editing' 
      can [:read, :update], Contact, :complete => true
    elsif user.role == 'Data Entry'
      can [:read, :create], Contact
    end
  end
end
