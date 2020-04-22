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

  def test_get_ingredients
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe.add_ingredient(ingredient1, 2)
    @recipe.add_ingredient(ingredient1, 4)
    @recipe.add_ingredient(ingredient2, 8)
    assert_equal [ingredient1, ingredient2], @recipe.ingredients
  end

  def test_total_calories
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    recipe2 = Recipe.new("Cheese Burger")

    @recipe.add_ingredient(ingredient1, 2)
    @recipe.add_ingredient(ingredient2, 8)
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)

    assert_equal 440, @recipe.total_calories
    assert_equal 675, recipe2.total_calories
  end

end
