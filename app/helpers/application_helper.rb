module ApplicationHelper
  
  def bills
    if current_user.role.super_admin == true 
      @bills = Bill.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @bills = Bill.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @bills = Bill.where(:id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def cellphones
    if current_user.role.super_admin == true 
      @cellphones = Cellphone.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @cellphones = Cellphone.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @cellphones = Cellphone.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def client_branches
    if current_user.role.super_admin == true 
      @client_branches = ClientBranch.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @client_branches = ClientBranch.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @client_branches = ClientBranch.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end

  def clients
    if current_user.role.super_admin == true 
      @clients = Client.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @clients = Client.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @clients = Client.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end  
  
  def branches
    if current_user.role.super_admin == true 
      @branches = Branch.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @branches = Branch.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @branches = Branch.where(:id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def drivers
    if current_user.role.super_admin == true 
      @drivers = Driver.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @drivers = Driver.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @drivers = Driver.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def users
    if current_user.role.super_admin == true 
      @users = User.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @users = User.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @users = User.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def schedules
    if current_user.role.super_admin == true 
      @schedules = Schedule.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @schedules = Schedule.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @schedules = Schedule.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def routes_histories
    if current_user.role.super_admin == true 
      @routes_histories = RoutesHistory.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @routes_histories = RoutesHistory.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @routes_histories = RoutesHistory.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def schedules_histories
    if current_user.role.super_admin == true 
      @schedules_histories = SchedulesHistory.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @schedules_histories = SchedulesHistory.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @schedules_histories = SchedulesHistory.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def tasks
    if current_user.role.super_admin == true 
      @tasks = Task.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @tasks = Task.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @tasks = Task.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def trucks
    if current_user.role.super_admin == true 
      @trucks = Truck.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @trucks = Truck.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @trucks = Truck.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def brakes_systems
    if current_user.role.super_admin == true 
      @brakes_systems = BrakesSystem.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @brakes_systems = BrakesSystem.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @brakes_systems = BrakesSystem.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def cabins
    if current_user.role.super_admin == true 
      @cabins = Cabin.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @cabins = Cabin.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @cabins = Cabin.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def compactor_drawers
    if current_user.role.super_admin == true 
      @compactor_drawers = CompactorDrawer.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @compactor_drawers = CompactorDrawer.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @compactor_drawers = CompactorDrawer.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def drive_systems
    if current_user.role.super_admin == true 
      @drive_systems = DriveSystem.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @drive_systems = DriveSystem.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @drive_systems = DriveSystem.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def electrical_systems
    if current_user.role.super_admin == true 
      @electrical_systems = ElectricalSystem.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @electrical_systems = ElectricalSystem.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @electrical_systems = ElectricalSystem.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def hydraulic_systems
    if current_user.role.super_admin == true 
      @hydraulic_systems = HydraulicSystem.order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @hydraulic_systems = HydraulicSystem.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @hydraulic_systems = HydraulicSystem.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
    end
  end
    
  def companies
    if current_user.role.super_admin == true 
      @companies = Company.order('id DESC').paginate(:page => params[:page])
    else  
      @companies = Company.where(:id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
    end
  end
  
  def roles
    if controller_name == "roles" and action_name == "index" 
      if current_user.role.super_admin == true 
        @roles = Role.order('id DESC').paginate(:page => params[:page])
      elsif current_user.role.company_admin == true 
        @roles = Role.where(:super_admin => false).order('id DESC').paginate(:page => params[:page])
      elsif current_user.role.branch_admin == true 
        @roles = Role.where(:super_admin => false, :company_admin => false).order('id DESC').paginate(:page => params[:page])
      end
    else 
      if current_user.role.super_admin == true 
        @roles = Role.where(:super_admin => false).order('id DESC').paginate(:page => params[:page])
      elsif current_user.role.company_admin == true 
        @roles = Role.where(:super_admin => false, :company_admin => false).order('id DESC').paginate(:page => params[:page])
      elsif current_user.role.branch_admin == true 
        @roles = Role.where(:super_admin => false, :company_admin => false, :branch_admin => false).order('id DESC').paginate(:page => params[:page])
      end
    end
  end
  
end
