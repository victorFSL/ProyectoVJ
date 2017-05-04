class LineItemsController < ApplicationController
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  skip_before_filter :set_state_city

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    price = Price.find(params[:price_id])
    @line_item = @cart.add_drug_price(price)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to state_city_drugs_path(@state = @line_item.price.drug_store.state_ids.first, @city = @line_item.price.drug_store.city_ids.first), notice: "#{@line_item.price.drug.name} fue agregado a tu carrito." }
      else
        format.html { redirect_to state_city_drugs_path(@state = @line_item.price.drug_store.state_ids.first, @city = @line_item.price.drug_store.city_ids.first), notice: 'Error al agregar tu medicina al carrito intenta de nuevo.' }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:price_id)
    end
end
