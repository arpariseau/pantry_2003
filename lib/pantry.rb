class Pantry
attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def restock(ingredient, amount)
    @stock[ingredient] += amount
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.map do |ingredient, amount|
      @stock[ingredient] >= amount
    end.all?
  end

end
