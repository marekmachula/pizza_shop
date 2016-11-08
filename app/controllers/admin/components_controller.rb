class Admin::ComponentsController < Admin::BaseController
  before_filter :load_component, except: [:index]

  def index
    @components = Component.order('name asc')
  end

  def new
  end

  def create
    @component = Component.new(component_params)
    if @component.save
      redirect_to [:admin, :components]
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @component.update_attributes(component_params)
      redirect_to [:admin, :components]
    else
      render action: 'edit'
    end
  end

  def destroy
    @component.destroy
    redirect_to [:admin, :components]
  end

  private

  def load_component
    @component = params[:id] ? Component.find(params[:id]) : Component.new
  end

  def component_params
    params.require(:component).permit(
        :name,
        :price
    )
  end
end