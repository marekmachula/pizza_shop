class Admin::PizzasController < Admin::BaseController
  before_filter :load_pizza, except: [:index]

  def index
    @pizzas = Pizza.order('price asc')
  end

  def new
  end

  def create
    @pizza = Pizza.new(pizza_params)
    if @pizza.save
      redirect_to [:edit, :admin, @pizza]
    else
      render action: 'new'
    end
  end

  def edit
    @components = Component.order('name asc')
  end

  def update
    if @pizza.update_attributes(pizza_params)
      redirect_to [:admin,:pizzas]
    else
      render action: 'edit'
    end
  end

  def destroy
    @pizza.destroy
    redirect_to [:admin, :pizzas]
  end

  private

  def load_pizza
    @pizza = params[:id] ? Pizza.find(params[:id]) : Pizza.new
  end

  def pizza_params
    params.require(:pizza).permit(
        :name,
        :price,
        :promo_price,
        component_ids:[]
    )
  end
end