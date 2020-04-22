require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'
require './lib/cook_book'
require './lib/ingredient'

class CookBookTest < Minitest::Test

  def setup
    @cookbook = CookBook.new
  end

  def test_existence
    assert_instance_of CookBook, @cookbook
  end

  def test_attributes
    assert_equal [], @cookbook.recipes
  end

  def test_add_recipes
    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")
    @cookbook.add_recipe(recipe1)
    @cookbook.add_recipe(recipe2)
    assert_equal [recipe1, recipe2], @cookbook.recipes
  end

  def setup_recipes
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")

    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)
    @cookbook.add_recipe(recipe1)
    @cookbook.add_recipe(recipe2)
  end

  def test_get_ingredients
    setup_recipes
    assert_equal ["Cheese", "Macaroni", "Ground Beef", "Bun"], @cookbook.ingredients
  end

  def test_highest_calorie_meal
    setup_recipes
    high_cal_recipe = @cookbook.recipes[1]
    assert_equal high_cal_recipe, @cookbook.highest_calorie_meal
  end

end
