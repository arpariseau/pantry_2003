require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
  end

  def test_existence
    assert_instance_of Pantry, @pantry
  end

  def test_attributes
    assert_equal ({}), @pantry.stock
  end

  def test_stock_check
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    assert_equal 0, @pantry.stock_check(ingredient1)
    @pantry.restock(ingredient1, 5)
    @pantry.restock(ingredient1, 10)
    assert_equal 15, @pantry.stock_check(ingredient1)
    @pantry.restock(ingredient2, 7)
    assert_equal 7, @pantry.stock_check(ingredient2)
  end

  def test_restock
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @pantry.restock(ingredient1, 5)
    @pantry.restock(ingredient1, 10)
    assert_equal 15, @pantry.stock[ingredient1]
  end

  def test_enough_ingredients_for
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe = Recipe.new("Mac and Cheese")
    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)

    @pantry.restock(ingredient1, 5)
    @pantry.restock(ingredient1, 10)
    assert_equal false, @pantry.enough_ingredients_for?(recipe)
    @pantry.restock(ingredient2, 7)
    assert_equal false, @pantry.enough_ingredients_for?(recipe)
    @pantry.restock(ingredient2, 1)
    assert_equal true, @pantry.enough_ingredients_for?(recipe)
  end

end
