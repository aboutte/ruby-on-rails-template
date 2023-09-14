# app/controllers/customers_controller.rb
class CustomersController < ApplicationController
  # GET /customers
  def index
    # Retrieve all customers from the database
    @customers = Customer.all
    # Render the index view with the customers data
    render json: @customers
  end

  # GET /customers/:id
  def show
    # Find the customer by id
    @customer = Customer.find(params[:id])
    # Render the show view with the customer data
    render json: @customer
  end

  # POST /customers
  def create
    # Create a new customer with the provided parameters
    @customer = Customer.new(customer_params)
    # Save the customer to the database
    if @customer.save
      # Render the created customer data
      render json: @customer, status: :created
    else
      # Render error messages if validation fails
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/:id
  def update
    # Find the customer by id
    @customer = Customer.find(params[:id])
    # Update the customer with the provided parameters
    if @customer.update(customer_params)
      # Render the updated customer data
      render json: @customer
    else
      # Render error messages if validation fails
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/:id
  def destroy
    # Find the customer by id
    @customer = Customer.find(params[:id])
    # Delete the customer from the database
    @customer.destroy
    # Render success message
    render json: { message: 'Customer deleted successfully' }
  end

  private

  # Strong parameters for customer creation and update
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email)
  end
end
