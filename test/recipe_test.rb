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

end
