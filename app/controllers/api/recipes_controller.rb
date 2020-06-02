class Api::RecipesController < ApplicationController

# def one_recipe_action
#   @recipe = Recipe.first
#   render "one_recipe.json.jb"
# end


def index
  @recipes = Recipe.all
  render "index.json.jb"
end

def show
  @recipe = Recipe.find_by(id: params[:id])
  render "show.json.jb"
end

def create
  @recipe = Recipe.new(
    title: params[:title],
    ingredients: params[:ingredients] ,
    directions: params[:directions],
    prep_time: params[:prep_time],
    image_url: params[:image_url],
    chef: params[:chef]
  )
  @recipe.save
  render "show.json.jb"
  
end

def update
  @recipe = Recipe.find_by(id: params[:id])
  @recipe.title = params[:title] || @recipe.title
  @recipe.ingredients = params[:ingredients] || @recipe.ingredients
  @recipe.directions = params[:directions] || @recipe.directions
  @recipe.prep_time = params[:prep_time] || @recipe.prep_time
  @recipe.chef = params[:chef] || @recipe.chef
  @recipe.image_url = params[:image_url] || @recipe.image_url

  render "show.json.jb"
end

def destroy
  @recipe = Recipe.find_by(id: params[:id])
  render json: {message: "Recipe destroyed successfully"}
  @recipe.destroy
end
end
