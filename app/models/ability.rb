class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    
    user ||= User.new

    alias_action :create, :read, :update, :destroy, :me, :confirmation, :contrat, to: :crud

    can :read, Location


    if user.role === 'admin'
      can [ Reservation, Location ], :all
      can [:index, :show, :create, :me, :confirmation], Contrat
    else
      if user.id
        can :manage, Reservation, { user_id: user.id }
        can [:show, :create, :me, :confirmation], Contrat, { user_id: user.id }
      end
    end
    
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
