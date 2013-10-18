class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    @user = User.find_by_id(user.id)
    if @user and @user.role.super_admin == true
      can :manage, :all
    elsif @user and @user.role.company_admin == true
      can [:manage], User, :company_id =>  @user.company_id 
      can [:show, :edit, :update, :index], Company, :id => @user.company_id 
      can [:edit, :update, :show, :new, :create, :index], Branch, :company_id => @user.company_id
      can [:index, :show], Role 
      can [:manage], Client, :company_id =>  @user.company_id
      can [:manage], Bill, :company_id =>  @user.company_id
      can [:manage], Cellphone, :company_id =>  @user.company_id
      can [:manage], Truck, :company_id =>  @user.company_id
      can [:manage], Driver, :company_id =>  @user.company_id
      can [:manage], Schedule, :company_id =>  @user.company_id
      can [:manage], Task, :company_id =>  @user.company_id      
      can [:manage], ClientBranch, :company_id =>  @user.company_id
      can [:manage], BrakesSystem, :company_id => @user.company_id 
      can [:manage], Cabin, :company_id => @user.company_id
      can [:manage], CompactorDrawer, :company_id => @user.company_id
      can [:manage], DriveSystem, :company_id => @user.company_id
      can [:manage], ElectricalSystem, :company_id => @user.company_id
      can [:manage], HydraulicSystem, :company_id => @user.company_id
      can [:manage], RoutesHistory, :company_id => @user.company_id
      can [:manage], SchedulesHistory, :company_id => @user.company_id
    elsif @user and @user.role.branch_admin == true
      can [:manage], User, :branch_id =>  @user.branch_id 
      can [:show, :index], Company, :id => @user.company_id 
      can [:show, :index], Branch, :company_id => @user.company_id
      can [:edit, :update], Branch, :id => @user.branch_id
      can [:index, :show], Role
      can [:manage], Client, :branch_id => @user.branch_id
      can [:manage], Bill, :branch_id => @user.branch_id
      can [:manage], Cellphone, :branch_id => @user.branch_id
      can [:manage], Truck, :branch_id => @user.branch_id
      can [:manage], Driver, :branch_id => @user.branch_id
      can [:manage], Schedule, :branch_id => @user.branch_id
      can [:manage], Task, :branch_id => @user.branch_id   
      can [:manage], ClientBranch, :branch_id => @user.branch_id
      can [:manage], BrakesSystem, :branch_id => @user.branch_id 
      can [:manage], Cabin, :branch_id => @user.branch_id
      can [:manage], CompactorDrawer, :branch_id => @user.branch_id
      can [:manage], DriveSystem, :branch_id => @user.branch_id
      can [:manage], ElectricalSystem, :branch_id => @user.branch_id
      can [:manage], HydraulicSystem, :branch_id => @user.branch_id
      can [:manage], RoutesHistory, :branch_id => @user.branch_id
      can [:manage], SchedulesHistory, :branch_id => @user.branch_id
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
