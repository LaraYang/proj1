class PokemonsController < ApplicationController
  def capture
    @pokemon = Pokemon.find(params[:id])
    @pokemon.trainer = current_trainer
    @pokemon.save
    redirect_to root_path
  end

  def damage
  	@pokemon = Pokemon.find(params[:id])
  	@pokemon.health = @pokemon.health - 10
  	curr_trainer = @pokemon.trainer
  	@pokemon.save
  	if (@pokemon.health <= 0)
      @pokemon.destroy
    end
  	redirect_to trainer_path(curr_trainer)
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.health = 100
    @pokemon.level = 1
    @pokemon.trainer = current_trainer
    if @pokemon.save
      redirect_to current_trainer
    else
      flash[:error] = @pokemon.errors.messages.to_s
      redirect_to new_pokemon_path 
    end
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name)
  end
end