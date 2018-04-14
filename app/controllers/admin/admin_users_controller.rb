class Admin::AdminUsersController < AdminController
 	before_action :authenticate_admin_user!
	before_action :set_admin_user, only: [:show, :edit, :update, :destroy]
 
	def index
		
	end

	def new
		@admin_user = AdminUser.new
	end

	def set_datatable

		respond_to do |format|
			format.html
			format.json { render json: AdminUserDatatable.new(view_context) }
		end	
	end

	def destroy
        
        respond_to do |format|
            @admin_user = AdminUser.find(params[:id])
            if @admin_user.destroy
                format.html {redirect_to :back,:notice=>"Gestor deletado com sucesso."}
            else
                format.html {redirect_to :back,:alert=>"Falha ao deletar gestor."}
            end
        end
    end

	def create

		respond_to do |format|
		  @admin_user = AdminUser.new(new_admin_params)
		  if @admin_user.save
		    format.html { redirect_to :back, notice: 'Gestor salvo com sucesso.' }
		  else
		    format.html { render :new, alert: 'Falha ao salvar gestor.' }
		  end
		end

	end

	# PATCH/PUT /users/1
	# PATCH/PUT /users/1.json
	def update

		respond_to do |format|
		  if @admin_user.update(admin_user_params)
		    format.html { redirect_to edit_admin_admin_user_path(@admin_user), notice: 'Dados alterados com sucesso' }
		    format.json { render :show, status: :ok, location: @admin_user }
		  else
		    format.html { render :edit }
		    format.json { render json: @admin_user.errors, status: :unprocessable_entity }
		  end
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_admin_user
	@admin_user = current_admin_user
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def admin_user_params
	params.require(:admin_user).permit(:password,:password_confirmation)
	end

	def new_admin_params
		params.require(:admin_user).permit(:password,:email)
	end
end
