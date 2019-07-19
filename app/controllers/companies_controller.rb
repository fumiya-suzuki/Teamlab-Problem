class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
  
  def show
    @company = Company.find(params[:id])
    if @company
      session[:company_id] = @company.id
    end
  end
  
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(company_params)
    if @company.save
      session[:company_id] = @company.id
      flash[:success] = '企業を新規登録しました。'
      redirect_to @company
    else
      render :new
    end
  end
  
  def login_page
    @companies = Company.all
  end
  
  
  private
  
  def company_params
      params.require(:company).permit(:name)
  end
end
