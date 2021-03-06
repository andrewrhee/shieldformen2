class CartsController < ApplicationController
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_url, notice: 'Invalid cart'
    else
      respond_to do |format|
        if session[:discount_code] != nil
          discount = Discount.find_by_discount_code(session[:discount_code])
          discount_factor = @cart.find_discount_factor(session[:discount_code])
          session[:discount_price] = @cart.discount_price(discount_factor)
          
          format.html # show.html.erb
          format.json { render json: @cart }
        else
          format.html # show.html.erb
          format.json { render json: @cart }
        end
      end
    end
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart }
    end
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @cart = Cart.find(params[:id])
    @discounts = @cart.discounts.new(:discount_code => params[:cart][:discount][:discount_code])
    session[:discount_code] = @discounts.discount_code.to_s
    respond_to do |format|
      if Discount.find_by_discount_code(session[:discount_code])
        @discount = Discount.find_by_discount_code(session[:discount_code])
        @product = Product.find(session[:product])

        @discount = @cart.add_product_with_code(@product.id, @discount.id)
        @discount.save!

        discount_factor = @cart.find_discount_factor(session[:discount_code])
        session[:discount_price] = @cart.discount_price(discount_factor)

        format.html { redirect_to @cart, notice: 'Discount code was valid.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @cart, notice: "Discount code was invalid." }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to store_url,
        notice: 'Your cart is currently empty' }
      format.json { head :no_content }
    end
  end
end
