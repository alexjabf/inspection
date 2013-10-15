module RolesHelper
  def get_roles
    if current_user.role.super_admin == true 
      @roles = Role.where(:super_admin => false).order('id DESC')
    elsif current_user.role.company_admin == true 
      @roles = Role.where(:super_admin => false, :company_admin => false).order('id DESC')
    elsif current_user.role.branch_admin == true 
      @roles = Role.where(:super_admin => false, :company_admin => false, :branch_admin => false).order('id DESC')
    end
  end
end
