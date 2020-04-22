require 'minitest/autorun'
require 'minitest/pride'
require './lib/recipe'
require './lib/cook_book'

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

end
