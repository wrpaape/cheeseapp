class CheesesController < ApplicationController
  def index
    @cheeses = {}
    Cheese.uniq.pluck(:variety).each { |variety| @cheeses[variety] = Cheese.where(variety: variety) }
  end

  def new
    @cheese = Cheese.new
  end

  def create
    if Cheese.find_by(name: cheese_params[:name])
      flash[:alert] = "this cheese already exists"
      render :new
    else
      cheese = Cheese.new(cheese_params)
      if cheese.save
        session[:cheese_id] = cheese.id
        redirect_to root_path, notice: 'cheese created!'
      else
        flash[:alert] = 'errors occured.'
        render :new
      end
    end
  end

  def show
    @cheese = Cheese.find(params[:id])
  end

  private

  def cheese_params
    params.require(:cheese).permit(:name, :password, :password_confirmation)
  end
end
