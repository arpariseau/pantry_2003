require 'date'

class CookBook
attr_reader :recipes, :date

    def initialize
      @recipes = []
      @date = Date.today.strftime("%m-%d-%Y")
    end

    def add_recipe(recipe)
      @recipes << recipe
    end

    def ingredients
      @recipes.flat_map do |recipe|
        recipe.ingredients.map {|ingredient| ingredient.name}
      end.uniq
    end

    def highest_calorie_meal
      @recipes.max_by {|recipe| recipe.total_calories}
    end

    def summary
      @recipes.map do |recipe|
        {name: recipe.name,
         details: {
           ingredients: recipe.ingredients_required.sort_by do |ingredient, amount|
             ingredient.calories * amount
           end.reverse.map do |ingredient, amount|
             {ingredient: ingredient.name,
             amount: "#{amount} #{ingredient.unit}"}
           end,
           total_calories: recipe.total_calories}
         }
      end
    end

end
