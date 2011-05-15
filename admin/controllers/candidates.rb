Admin.controllers :candidates do

  get :index do
    @candidates = Candidate.all
    render 'candidates/index'
  end

  get :new do
    @candidate = Candidate.new
    render 'candidates/new'
  end

  post :create do
    @candidate = Candidate.new(params[:candidate])
    if @candidate.save
      flash[:notice] = 'Candidate was successfully created.'
      redirect url(:candidates, :edit, :id => @candidate.id)
    else
      render 'candidates/new'
    end
  end

  get :edit, :with => :id do
    @candidate = Candidate.find(params[:id])
    render 'candidates/edit'
  end

  put :update, :with => :id do
    @candidate = Candidate.find(params[:id])
    if @candidate.update_attributes(params[:candidate])
      flash[:notice] = 'Candidate was successfully updated.'
      redirect url(:candidates, :edit, :id => @candidate.id)
    else
      render 'candidates/edit'
    end
  end

  delete :destroy, :with => :id do
    candidate = Candidate.find(params[:id])
    if candidate.destroy
      flash[:notice] = 'Candidate was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Candidate!'
    end
    redirect url(:candidates, :index)
  end
end