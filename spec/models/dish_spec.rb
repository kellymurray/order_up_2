require 'rails_helper'


  RSpec.describe Dish, type: :model do
    before :each do

      @chef = Chef.create!(name: 'Cat Cora')
      @dish_1 = @chef.dishes.create!(name: 'Taco', description: 'corn sandwich')
      @ingredient_1 = Ingredient.create!(name: 'Chicken', calories: 200)
      @ingredient_2 = Ingredient.create!(name: 'Tortilla', calories: 100)
      @ingredient_3 = Ingredient.create!(name: 'Lettuce', calories: 20)
      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
      DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_3)
    end

    describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
    end

    describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients}
      it {should have_many(:ingredients).through(:dish_ingredients)}
    end

  describe "instance methods" do
      describe "#total_calories" do
        it "returns total calories of a dish" do
          expect(@dish_1.total_calories).to eq(320)
        end
      end
    end
  end
