class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == 'Master'
      can :manage, :all
    elsif user.role == 'Contact Editing' 
      can [:read, :update], Contact, :complete => false
    elsif user.role == 'Data Entry'
      can :create, Contact
    end
  end
end
