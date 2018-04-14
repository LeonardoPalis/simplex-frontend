class Admin::ProductionController < AdminController
	before_action :authenticate_admin_user!
	before_action :set_product, only:[:show_details]
	before_action :set_employees, only:[:index]
	before_action :set_resources, only:[:index]
	before_action :set_resource, only:[:destroy_resource]
	def index
		@work = Product.joins(:works).group(:product_id)
		@works = Work.new
		@resource = Resource.new
	end

	def employee_hour
		@work = Work.new
	end

	def resources
		@resource = Resource.new
	end

	def show_details
		@employees = Work.where(product_id: @product.id)

	end

	def create_resource
	  
		respond_to do |format|
			@resource = Resource.new
			@resource.name = params[:name]
			@resource.quantity = params[:resource][:quantity]
			@resource.product_id = params[:products]
			if @resource.save
		    	format.html {redirect_to :back,:notice=>"Restrição do produto #{Product.find(@resource.product_id).name} criada com sucesso."}
			else
		    	format.html {redirect_to :back,:alert=>"Falha ao criar produção do produto #{Product.find(@resource.product_id).name}."}
			end
		end
		
	end

	def create_work
		@work = Work.new
		@work.hour_per_unit = params[:work][:hour_per_unit].to_i
		@work.employee_id = params[:work][:employee_id]
		@work.product_id = params[:work][:product_id]
		@work.save 		
	end

	def destroy_resource
		respond_to do |format|
            if @resource.destroy
                format.html {redirect_to :back,:notice=>"Recurso deletado com sucesso."}
            else
                format.html {redirect_to :back,:alert=>"Falha ao deletar recurso."}
            end
        end
	end

	def new
		@work = Work.new
		@employees = Employee.all.pluck(:name,:id)
		@products = Product.all.pluck(:name,:id)
	end

	def set_datatable_resource

        respond_to do |format|
            format.html
            format.json { render json: ResourceDatatable.new(view_context, {product_id: params[:product_id]}) }
        end 
    end

   

private

	def product_params
    	params.require(:product).permit(:name, :description, :net_profit)
    end

    def resource_params
    	params.require(:resource).permit(:name, :operation, :quantity, :product_id)    	
	end

	def set_employees
		@employees = Employee.all.pluck(:name,:id)
	end

	def set_resource
		@resource = Resource.find(params[:id])
	end
	def set_product
		@product = Product.find(params[:id])
	end
	
	def set_resources
		@resources = TypeResource.all.pluck(:name)
	end


end
