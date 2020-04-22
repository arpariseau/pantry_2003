require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def setup
    @recipe = Recipe.new("Mac and Cheese")
  end

  def test_existence
    assert_instance_of Recipe, @recipe
  end

  def test_attributes
    assert_equal "Mac and Cheese", @recipe.name
    assert_equal ({}), @recipe.ingredients_required
  end

  def test_add_ingredient
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe.add_ingredient(ingredient1, 2)
    @recipe.add_ingredient(ingredient1, 4)
    @recipe.add_ingredient(ingredient2, 8)
    expected = {ingredient1 => 6, ingredient2 => 8}
    assert_equal expected, @recipe.ingredients_required
  end

end
