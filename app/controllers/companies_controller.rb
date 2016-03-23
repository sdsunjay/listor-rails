class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
    def index
        setup_companies
  end

  def new
    @page_title = 'Add New Company'
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)

    # Save the company
    if @company.save
      flash[:notice] = "Company Created"
      redirect_to companies_path
    else
      flash[:alert] = "Company Not Created"
      setup_questions
      render action: 'index'
    end
  end

  def update
    @company = Company.find(params[:id])

    # Update the company
    if @company.update(company_params)
      flash[:notice] = "Company Updated"
      redirect_to companies_path
    else
      flash[:alert] = "Company Not Updated"
      render 'edit'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def destroy
    @company = Company.find(params[:id])

    # Delete the company
    if @company.destroy
      flash[:notice] = "Company Removed"
      redirect_to companies_path
    else
      flash[:alert] = "Company Not Removed"
      render 'destroy'
    end
  end


  private

  def setup_companies
    @companies = Company.all.order(created_at: :desc).paginate(per_page: 10, page: params[:page])
        @company ||= Company.new
  end
  
  def set_company
    @company = Company.find(params[:id])
  end
  
  def company_params
    params.require(:company).permit(:name, :city, :notes)
  end
end
