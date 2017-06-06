require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative './models/pizza_order'
require_relative './models/customer'

get '/pizzas' do
  @pizzas = PizzaOrder.all()
  erb(:index)
end

get '/pizza/new' do 
  @customers = Customer.all()
  erb(:new)
end

get '/pizza/:id' do
  @pizza = PizzaOrder.find(params[:id])
  erb(:show)
end

post '/pizzas' do
  @pizza = PizzaOrder.new(params)
  @pizza.save()
  erb(:create)
end

get '/pizza/:id/edit' do 
  @pizza = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza/:id' do
  @pizza = PizzaOrder.find(params[:id])
  @pizza.update(params)
  redirect to "/pizza/#{params[:id]}"
end

post '/pizza/:id/delete' do
  @pizza = PizzaOrder.find(params[:id])
  @pizza.delete()
  redirect to "/pizzas"
end

get '/customers' do
  @customers = Customer.all()
  erb(:customer_all)
end

get '/customers/new' do 
  @customers = Customer.all()
  erb(:customer_new)
end

get '/customers/:id' do
  @customers = Customer.find(params[:id])
  erb(:customer_show)
end

post '/customers' do
  @customers = Customer.new(params)
  @customers.save()
  erb(:customer_create)
end

get '/customers/:id/edit' do 
  @customers = Customer.find(params[:id])
  erb(:customer_edit)
end

post '/customers/:id' do
  @customers = Customer.find(params[:id])
  @customer.update(params)
  redirect to "/customers/#{params[:id]}"
end

post '/customers/:id/delete' do
  @customers = Customer.find(params[:id])
  @customers.delete()
  redirect to "/customers"
end

