module AdminChecker
  def check_admin
    unless current_admin
      render json: {error: "Unfortunatly, you are not loged in("}, status: 401
    end
  end
end