Admin.controllers :auditions do

  get :index do
    @auditions = Audition.all
    render 'auditions/index'
  end

  get :new do
    @audition = Audition.new
    render 'auditions/new'
  end

  post :create do
    @audition = Audition.new(params[:audition])
    if @audition.save
      flash[:notice] = 'Audition was successfully created.'
      redirect url(:auditions, :edit, :id => @audition.id)
    else
      render 'auditions/new'
    end
  end

  get :edit, :with => :id do
    @audition = Audition.find(params[:id])
    render 'auditions/edit'
  end

  put :update, :with => :id do
    @audition = Audition.find(params[:id])
    if @audition.update_attributes(params[:audition])
      flash[:notice] = 'Audition was successfully updated.'
      redirect url(:auditions, :edit, :id => @audition.id)
    else
      render 'auditions/edit'
    end
  end

  delete :destroy, :with => :id do
    audition = Audition.find(params[:id])
    if audition.destroy
      flash[:notice] = 'Audition was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Audition!'
    end
    redirect url(:auditions, :index)
  end
end