module Api
  module V1
    class ProductController < ApplicationController
      def index
        products = Product.all;
        render json: { status: 'SUCCESS', message: 'Loaded articles', data: products }, status: :ok
      end
    end
  end
end
