
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_user 
    if student_signed_in?
      current_student
    end    
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to request.referrer, :alert => exception.message
    flash[:notice] = "Non sei autorizzato a effettuare questa operazione!!"
  end

  protected

  def configure_permitted_parameters
    
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :username) }
    #devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(  :email,:password, :password_confirmation, roles: []) }
  end
 

end

