class ProductController < ApplicationController

  def index
    @products = Product.all;
    @admin = false;
    if user_signed_in?
      if current_user.admin
        @admin = true;
      end
    end
  end

  def new
    @admin = false;
    if user_signed_in?
      if current_user.admin
        @admin = true;
      end
    end
  end

  def show
    @product = Product.find(params[:id]);
    @admin = false;
    if user_signed_in?
      if current_user.admin
        @admin = true;
      end
    end
  end

  def destroy
    if user_signed_in?
      if current_user.admin
        Product.find(params[:id]).destroy;
      end
    end
    redirect_to product_index_path
  end

  def edit
    @product = Product.find(params[:id]);
    @admin = false;
    if user_signed_in?
      if current_user.admin
        @admin = true;
      end
    end
  end

  def update
    @product = Product.find(params[:id]);
    if @product.update(product_params)
      flash[:notice] = "Successfully editted new product!"
      redirect_to product_index_path
    else
      flash[:alert] = "Error editing new product!"
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Successfully added new product!"
      redirect_to product_index_path
    else
      flash[:alert] = "Error adding new product!"
      render :new
    end
  end

  def rate
    if user_signed_in?
      id = params[:id];
      product = Product.find(id);
      rate = params[:rate].to_i;
      totalRates = product.totalRates;
      totalRating = totalRates * product.rate;
      totalRates = totalRates + 1;
      rate = (rate + totalRating) / totalRates;
      Product.update(product.id, rate: rate, totalRates: totalRates);
      redirect_to product_path(product.id);
    end
  end

  private

  def product_params
   params.require(:product).permit(:avatar, :rate, :description, :title, :price)
  end

end
