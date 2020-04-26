class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Article # permissions fosr every user, even isf not logged in    
    if user.present?  # additional permissions fosr logged in users (they can manage their posts)
      can :create , Article

      can [:destroy, :update] , Article, user_id: user.id 
      
    end
  end
end
