module BranchesHelper
  def get_branches
    if current_user.role.super_admin == true 
      @branches = Branch.order('id DESC')
    elsif current_user.role.company_admin == true 
      @branches = Branch.where(:company_id => current_user.company_id).order('id DESC')
    elsif current_user.role.branch_admin == true 
      @branches = Branch.where(:id => current_user.branch_id).order('id DESC')
    end
  end
end
