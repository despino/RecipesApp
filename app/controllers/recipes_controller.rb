class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  #POST /recipes/1/add_tag
  def add_tag
    @recipe = Recipe.find(params[:id])
    newTag = Tag.new(params[:tag])
    if newTag.valid?
      newTag.save
      @recipe.tags << newTag
      @recipe.save
    end
    render 'show.html.erb'
  end

  def add_rating
    @recipe = Recipe.find(params[:id])
    newRating = Rating.new(params[:rating])
    if newRating.valid?
      newRating.save
      @recipe.ratings << newRating
      # @avgRating = @recipe.ratings.average(:rating).round(1)
      @recipe.save
    end
    render 'show.html.erb'
  end
  # def sort
  #   @recipes = Recipe.all
  #   recipeRating = Rating.where(params[:recipe_id])
  #   aRecipeRating = []
  #   if !recipeRating.nil?
  #     @recipes.each do |recipe|
  #       recipeRating = recipe.ratings
  #       aRecipeRating << recipeRating
  #       aRecipeRating.inject { |sum, el| sum + el } / aRecipeRating.size
  #     end
  #   else
  #     puts "I don't know"
  #   end

    # @ratings = Rating.all
    # @ratings = Rating.order.average(rating: :asc)
  # end

  # def sort
  #   @recipes = Recipe.all
  #   @recipes = Recipe.order(title: :asc)
  # end

avgRating

def average
@avgRating = @recipe.ratings.average
end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :author, :ingredients, :instructions)
    end
end
