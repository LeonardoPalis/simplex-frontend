class Admin::EmployeesController < AdminController
	before_action :authenticate_admin_user!
	before_action :set_employee, only:[:show, :edit, :update, :destroy]
	
	def index
	end

	def show
	end

	def new
		@employee = Employee.new
	end
	
	def create
		
		respond_to do |format|
            @employee = Employee.new(employee_params)
            if @employee.save
                format.html {redirect_to :back,:notice=>"Funcionário criado com sucesso."}
            else
                format.html {redirect_to :back,:alert=>"Falha ao criar funcionário."}
            end
        end
	end

	def update
		respond_to do |format|
            if @employee.update(employee_params)
                format.html {redirect_to :back,:notice=>"Funcionário atualizada com sucesso."}
            else
                format.html {redirect_to :back,:alert=>"Falha ao atualizar funcionário."}
            end
        end
	end

	def destroy
        
        respond_to do |format|
            if @employee.destroy
                format.html {redirect_to :back,:notice=>"Funcionário deletado com sucesso."}
            else
                format.html {redirect_to :back,:alert=>"Falha ao deletar funcionário."}
            end
        end
    end

	def set_datatable_employees

        respond_to do |format|
            format.html
            format.json { render json: EmployeeDatatable.new(view_context) }
        end 
    end

    private

    def set_employee
    	@employee = Employee.find(params[:id])
    end	

    def employee_params
    	params.require(:employee).permit(:name, :email, :work_hours)
    end
end
