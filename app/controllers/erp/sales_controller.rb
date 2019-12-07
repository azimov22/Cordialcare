module Erp
  class SalesController < BaseController
    require 'date_extensions'
    def index
      @sales = Sale.all
      unless['', 'all'].include? params.fetch(:id, "all")
        @sales = @sales.where(id: params[:id])
      end
      unless ['', 'all'].include? params.fetch(:seller_id, "all")
        @sales = @sales.where(seller_id: params[:seller_id])
      end
      unless ['', 'all'].include? params.fetch(:team_id, "all")
        @sales = @sales.where(team_id: params[:team_id])
      end
      unless ['', 'all'].include? params.fetch(:sale_type_id, "all")
        @sales = @sales.where(sale_type_id: params[:sale_type_id])
      end
        @sales = @sales.order(updated_at: :desc)
    end

    def show
      @sale = Sale.find(params[:id])
    end

    def select_type
      @sale_types = SaleType.all
    end

    def new
      @sale = Sale.new
      @sale.sale_type_id = params[:sale_type_id]
    end

    def create
      @sale = Sale.new(permitted_params)
      @sale.status = :new
      @sale.sale_type_id = params[:sale][:sale_type_id]
      @sale.seller_id = params[:seller_id]
      if params[:sale][:sale_type_id].to_i == SaleType.find_by(name: "Self purchasing").id
        @sale.buyer = Member.find(params[:seller_id])
      elsif params[:sale][:sale_type_id].to_i == SaleType.find_by(name: "New member").id
        b = Member.new(username: params[:sale][:member][:username],
                       first_name: params[:sale][:member][:first_name],
                       last_name: params[:sale][:member][:last_name],
                       email: params[:sale][:member][:email],
                       birthday: params[:sale][:member][:birthday],
                       phone_number: params[:sale][:member][:phone_number],
                       member_role_id: params[:sale][:member][:member_role_id],
                       team_id: params[:sale][:member][:team_id],
                       gender: params[:sale][:member][:gender],
                       marital_status: params[:sale][:member][:marital_status],
                       address: params[:sale][:member][:address],
                       password: params[:sale][:member][:password],
                       password_confirmation: params[:sale][:member][:password_confirmation])
        b.generate_membership_id
        if b.save
          @sale.buyer = Member.find(b.id)
        else
          b.errors
        end
      else
        b = NonMember.new(first_name: params[:sale][:non_member][:first_name],
                          last_name:  params[:sale][:non_member][:last_name],
                          phone_number:  params[:sale][:non_member][:phone_number])
        if b.save
          @sale.buyer = NonMember.find(b.id)
        else
          b.errors
        end
      end
      seller = Member.find_by(id: params[:seller_id])
      @sale.team = seller.team
      @sale.sale_date = params[:sale][:sale_date]
      permitted_items = params.require(:sale).permit([items: [:product_id, :quantity]])
      permitted_items.to_h.each do |key, value|
        @items_array = []
        next if String === value
        value.each { |key, value|
          items_id = value[:product_id]
          items_quantity = value[:quantity]
          if @sale.seller_id == @sale.buyer_id
            price = Product.find_by(id: items_id).sales_price
            amount = items_quantity.to_i * price
          else
            price = Product.find_by(id: items_id).unit_price
            amount = items_quantity.to_i * price
          end
          sales_product = SalesProduct.create(product_id: items_id,
                                              quantity: items_quantity,
                                              amount: amount,
                                              price: price)
          @items_array.push(sales_product.id)
        }
      end
      @items_array
      @sale.sales_product_ids = @items_array

      if @sale.save
        redirect_to sales_path, notice: "Sale ##{@sale.id} created"
      else
        redirect_to sales_type_new_path(@sale.type), notice: "#{@sale.errors.name}"
      end
    end

    def edit
      @sale = Sale.find(params[:id])
    end

    def update
      @sale = Sale.find(params[:id])
      @sale.status = :updated
      @sale.sale_type_id = params[:sale][:sale_type_id]
      @sale.seller_id = params[:seller_id]
      if params[:sale][:sale_type_id].to_i == SaleType.find_by(name: "Self purchasing").id
        @sale.buyer = Member.find(params[:seller_id])
      elsif params[:sale][:sale_type_id].to_i == SaleType.find_by(name: "New member").id
        b = Member.find_by(id: @sale.buyer_id)
        b.update(username: params[:sale][:member][:username],
                       first_name: params[:sale][:member][:first_name],
                       last_name: params[:sale][:member][:last_name],
                       email: params[:sale][:member][:email],
                       birthday: params[:sale][:member][:birthday],
                       phone_number: params[:sale][:member][:phone_number],
                       member_role_id: params[:sale][:member][:member_role_id],
                       team_id: params[:sale][:member][:team_id],
                       gender: params[:sale][:member][:gender],
                       marital_status: params[:sale][:member][:marital_status],
                       address: params[:sale][:member][:address],
                       password: params[:sale][:member][:password],
                       password_confirmation: params[:sale][:member][:password_confirmation])
        b.generate_membership_id
        if b.save
          @sale.buyer = Member.find(b.id)
        else
          b.errors
        end
      else
        b = NonMember.find_by(id: @sale.buyer_id)
        b.update(first_name: params[:sale][:non_member][:first_name],
                          last_name:  params[:sale][:non_member][:last_name],
                          phone_number:  params[:sale][:non_member][:phone_number])
        if b.save
          @sale.buyer = NonMember.find(b.id)
        else
          b.errors
        end
      end
      seller = Member.find_by(id: params[:seller_id])
      @sale.team = seller.team
      @sale.sale_date = params[:sale][:sale_date]
      permitted_items = params.require(:sale).permit([items: [:product_id, :quantity]])
      permitted_items.to_h.each do |key, value|
        @items_array = []
        next if String === value
        value.each { |key, value|
          items_id = value[:product_id]
          items_quantity = value[:quantity]
          if @sale.seller_id == @sale.buyer_id
            price = Product.find_by(id: items_id).sales_price
            amount = items_quantity.to_i * price
          else
            price = Product.find_by(id: items_id).unit_price
            amount = items_quantity.to_i * price
          end
          sales_product = SalesProduct.create(product_id: items_id,
                                              quantity: items_quantity,
                                              amount: amount,
                                              price: price)
          @items_array.push(sales_product.id)
        }
      end
      @items_array
      @sale.sales_product_ids = @items_array

      if @sale.save
        redirect_to sales_path, notice: "Sale ##{@sale.id} updated"
      else
        redirect_to sales_type_new_path(@sale.type), notice: "#{@sale.errors.name}"
      end
    end

    private

    def permitted_params
      params.require(:sale).permit(:quantity,
                                   product_ids: [])
    end
  end
end
