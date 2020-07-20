class Recipe
  attr_reader :name, :description, :prep_time, :difficulty, :done

  def initialize(name, description, prep_time, difficulty, done = false)
    @name = name
    @description = description
    @prep_time = prep_time
    @difficulty = difficulty
    @done = done
  end

  def done?
    return @done
  end

  def done!
    @done = true
  end
end


new_instance = Recipe.new("Chocolate Cake", "Delish Chocolate Cake", "15 min", "easy")
p new_instance


