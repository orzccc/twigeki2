Admin.controllers :teams do

  get :index do
    @teams = Team.all
    render 'teams/index'
  end

  get :new do
    @team = Team.new
    render 'teams/new'
  end

  post :create do
    @team = Team.new(params[:team])
    if @team.save
      flash[:notice] = 'Team was successfully created.'
      redirect url(:teams, :edit, :id => @team.id)
    else
      render 'teams/new'
    end
  end

  get :edit, :with => :id do
    @team = Team.find(params[:id])
    render 'teams/edit'
  end

  put :update, :with => :id do
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      flash[:notice] = 'Team was successfully updated.'
      redirect url(:teams, :edit, :id => @team.id)
    else
      render 'teams/edit'
    end
  end

  delete :destroy, :with => :id do
    team = Team.find(params[:id])
    if team.destroy
      flash[:notice] = 'Team was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Team!'
    end
    redirect url(:teams, :index)
  end
end