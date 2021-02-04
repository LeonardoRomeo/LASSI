class Students::SessionsController < Devise::SessionsController
  
  

  def after_sign_out_path_for(_resource_or_scope)
    request.referrer
  end

  def after_sign_in_path_for(resource_or_scope)
    root_path
  end
end
