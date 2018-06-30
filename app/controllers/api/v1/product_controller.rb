module Api
  module V1
    class ProductController < ApplicationController
      def index
        products = Product.all;
        avatars = Array.new;
        products.each do |product|
          avatar_url = product.avatar.url;
          avatars.push(avatar_url);
        end
        render json: { status: 'SUCCESS', message: 'Loaded products', data: products, avatar: avatars }, status: :ok
      end
    end
  end
end
