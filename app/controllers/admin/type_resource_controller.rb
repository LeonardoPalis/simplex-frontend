class Admin::TypeResourceController < AdminController
	before_action :authenticate_admin_user!
	before_action :set_type_resource, only:[:edit,:update,:destroy]

	def index
	end

	def set_datatable_type_resources
        respond_to do |format|
            format.html
            format.json { render json: TypeResourceDatatable.new(view_context) }
        end 
    end

    def new
		@type_resource = TypeResource.new
	end
	
	def create	
		respond_to do |format|
            @type_resource = TypeResource.new(type_resource_params)
            if @type_resource.save
                format.html {redirect_to admin_type_resource_index_path,:notice=>"Recurso criado com sucesso."}
            else
                format.html {redirect_to :back,:alert=>"Falha ao criar recurso."}
            end
        end
	end

	def update
		respond_to do |format|
            if @type_resource.update(type_resource_params)
                format.html {redirect_to admin_type_resource_index_path,:notice=>"Recurso atualizado com sucesso."}
            else
                format.html {redirect_to :back,:alert=>"Falha ao atualizar recurso."}
            end
        end
	end

	def destroy        
        respond_to do |format|
            if @type_resource.destroy
                format.html {redirect_to :back,:notice=>"Recurso deletado com sucesso."}
            else
                format.html {redirect_to :back,:alert=>"Falha ao deletar recurso."}
            end
        end
    end


	private

	def set_type_resource
		@type_resource = TypeResource.find(params[:id])
	end

    def type_resource_params
    	params.require(:type_resource).permit(:name, :max_quantity)
    end

end
