class WelcomeController < ActionController::Base

  def index
    render :file => 'public/landing_page.html'
  end

  def get_random_recipe
     @recipe = Recipe.all.sample
     respond_to do |format|
       format.html { redirect_to recipes_url }
       format.json { render :show, status: :ok, location: @recipe }
     end
   end

end
