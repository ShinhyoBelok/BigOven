class FoodsController < ApplicationController
  # GET /foods or /foods.json
  def index
    @foods = Food.all.where(user_id: current_user)
  end

  # GET /foods/1 or /foods/1.json
  def show
    @food = Food.find(params[:id])
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)
    @food.user = current_user

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_url }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def shopping_list
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.all.where(recipe_id: params[:id])
    @foods = @recipe.public ? Food.all : Food.all.where(user_id: current_user)
    @shopping_list_foods = []
    @total_price = 0
    @recipe_foods.each do |recipe_food|
      food = @foods.find { |food_item| food_item.id == recipe_food.food_id }

      @quantity = if @recipe.public
                    recipe_food.quantity * -1
                  else
                    food.quantity - recipe_food.quantity
                  end

      next unless food && @quantity.negative?

      @shopping_list_foods << { name: food.name, quantity: @quantity * -1, measurement_unit: food.measurement_unit,
                                price: food.price }
      @total_price += food.price * @quantity * -1
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
