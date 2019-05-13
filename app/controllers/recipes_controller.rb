class RecipesController < ApplicationController


  def index

    if params[:category].blank?
      @recipes = Recipe.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @recipes = Recipe.where(category_id: @category_id).order("created_at DESC")
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if
    @recipe.save
    redirect_to @recipe
    else
    render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to root_path
  end

private
  def recipe_params
    params.require(:recipe).permit(:title, :text, :category_id)
  end

end
