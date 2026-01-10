class EmployeesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end
end
