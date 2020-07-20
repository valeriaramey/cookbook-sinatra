require "csv"
require_relative "recipe"

class Cookbook
  def initialize(csv_file)
    @recipes = [] # <--- <Recipe> instances
    @csv_file = csv_file
    load_csv
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_to_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_to_csv
  end

  def all
    return @recipes
  end

  def find(index)
    return @recipes[index]
  end

 def mark_as_done(index)
    @recipes[index].done!
    save_to_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4] == "true")
    end
  end


  def save_to_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.difficulty, recipe.done]
      end
    end
  end
end
