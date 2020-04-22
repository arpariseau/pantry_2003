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

end
