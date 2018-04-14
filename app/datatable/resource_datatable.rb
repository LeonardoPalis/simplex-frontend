class ResourceDatatable < AjaxDatatablesRails::Base
 
 def_delegators :@view, :link_to, :admin_type_resource_path, :edit_admin_type_resource_path , :show_details_admin_production_path,  :content_tag

  def searchable_columns
  @searchable_columns ||= [
     'Resource.name'

  ]
end

def sortable_columns
  @sortable_columns ||= [

    'Resource.name'
  ]
end

  private

  def data
    
    records.map do |record|
     {

          '0' => record.name,
          '1' => record.quantity,
          '2'=> TypeResource.where(name: record.name).blank? ? "Recurso não encontrado" : TypeResource.where(name: record.name).first.max_quantity,    
          'DT_RowId' => record.id
      }
    end
  end

  def get_raw_records
      
      Resource.where(product_id: options[:product_id])
     
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
