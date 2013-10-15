module CompaniesHelper
  def get_companies
    if current_user.role.super_admin == true 
      @companies = Company.order('id DESC')
    else  
      @companies = Company.where(:id => current_user.company_id).order('id DESC')
    end
  end
end
