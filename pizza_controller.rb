require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative ( './models/pizza_order')

also_reload ( './models/*')
# Sinatra function to reload file everytime


# INDEX route___create a route for people can see pizza orders
get '/pizza-orders' do
  # beaware its pizza-order not pizza_order
  @orders = PizzaOrder.all()
  erb (:index)
end

# NEW route (Create)
get '/pizza-orders/new' do
  erb(:new)
end

# SHOW route
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)

end

#Create
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end
