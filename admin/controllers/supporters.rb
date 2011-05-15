Admin.controllers :supporters do

  get :index do
    @supporters = Supporter.all
    render 'supporters/index'
  end

  get :new do
    @supporter = Supporter.new
    render 'supporters/new'
  end

  post :create do
    @supporter = Supporter.new(params[:supporter])
    if @supporter.save
      flash[:notice] = 'Supporter was successfully created.'
      redirect url(:supporters, :edit, :id => @supporter.id)
    else
      render 'supporters/new'
    end
  end

  get :edit, :with => :id do
    @supporter = Supporter.find(params[:id])
    render 'supporters/edit'
  end

  put :update, :with => :id do
    @supporter = Supporter.find(params[:id])
    if @supporter.update_attributes(params[:supporter])
      flash[:notice] = 'Supporter was successfully updated.'
      redirect url(:supporters, :edit, :id => @supporter.id)
    else
      render 'supporters/edit'
    end
  end

  delete :destroy, :with => :id do
    supporter = Supporter.find(params[:id])
    if supporter.destroy
      flash[:notice] = 'Supporter was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Supporter!'
    end
    redirect url(:supporters, :index)
  end
end