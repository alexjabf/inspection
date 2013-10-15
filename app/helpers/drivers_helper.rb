module DriversHelper
  def get_drivers
    if current_user.role.super_admin == true 
      @drivers = Driver.order('id DESC')
    elsif current_user.role.company_admin == true 
      @drivers = Driver.where(:company_id => current_user.company_id).order('id DESC')
    elsif current_user.role.branch_admin == true 
      @drivers = Driver.where(:id => current_user.branch_id).order('id DESC')
    end
  end
end
