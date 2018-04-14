class Admin::ProductsController < AdminController
	before_action :authenticate_admin_user!
	before_action :set_product, only:[:show, :edit, :update, :destroy]
	
	def index
	end

	def show
	end

	def new
		@product = Product.new
	end
	
	def create
		
		respond_to do |format|
            @product = Product.new(product_params)
            if @product.save
                format.html {redirect_to :back,:notice=>"Produto criado com sucesso."}
            else
                format.html {redirect_to :back,:alert=>"Falha ao criar produto."}
            end
        end
	end

	def update
		respond_to do |format|
            if @product.update(product_params)
                format.html {redirect_to :back,:notice=>"Produto atualizado com sucesso."}
            else
                format.html {redirect_to :back,:alert=>"Falha ao atualizar produto."}
            end
        end
	end

	def destroy
        
        respond_to do |format|
            if @product.destroy
                format.html {redirect_to :back,:notice=>"Produto deletado com sucesso."}
            else
                format.html {redirect_to :back,:alert=>"Falha ao deletar produto."}
            end
        end
    end

	def set_datatable_products

        respond_to do |format|
            format.html
            format.json { render json: ProductDatatable.new(view_context) }
        end 
    end

    private

    def set_product
    	@product = Product.find(params[:id])
    end	

    def product_params
    	params.require(:product).permit(:name, :description, :net_profit)
    end
end
