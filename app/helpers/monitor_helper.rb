module MonitorHelper
  def routes_histories
    if current_user.role.super_admin == true 
      @routes_histories = RoutesHistory.where("started_at is NOT NULL and closed = false").order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.company_admin == true 
      @routes_histories = RoutesHistory.where("started_at is NOT NULL and closed = false and company_id = #{current_user.company_id}").order('id DESC').paginate(:page => params[:page])
    elsif current_user.role.branch_admin == true 
      @routes_histories = RoutesHistory.where("started_at is NOT NULL and closed = false and branch_id = #{current_user.branch_id}").order('id DESC').paginate(:page => params[:page])
    end
  end
end
