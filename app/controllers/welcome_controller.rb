class WelcomeController < ActionController::Base

  def index
    render :file => 'public/landing_page.html'
  end
end
