class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    @user = User.find_by_id(user.id)
    if @user and @user.role.super_admin == true
      can :manage, :all
    elsif @user and @user.role.branch_admin == true
      can [:show], Company, :id => @user.branch.company_id 
      can [:edi, :update, :show], Branch, :id => @user.branch_id 
      can [:manage], User, :branch_id =>  @user.branch_id 
      can [:index, :show], Role, :branch_id => @user.branch_id 
      can [:manage], Client, :branch_id => @user.branch_id
      can [:manage], Bill, :branch_id => @user.branch_id
      can [:manage], Cellphone, :branch_id => @user.branch_id
      can [:manage], Truck, :branch_id => @user.branch_id
      can [:manage], Driver, :branch_id => @user.branch_id
      can [:manage], Schedule, :branch_id => @user.branch_id
    else
      can :read, Branch 
    end

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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
