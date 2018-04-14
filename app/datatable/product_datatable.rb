class ProductDatatable < AjaxDatatablesRails::Base
 
 def_delegators :@view, :link_to, :admin_product_path, :edit_admin_product_path, :show_details_admin_production_path,  :content_tag

  def searchable_columns
  @searchable_columns ||= [
     'Product.name'

  ]
end

def sortable_columns
  @sortable_columns ||= [

    'Product.name'
  ]
end

  private

  def data
    
    records.map do |record|
     {

          '0' => record.name,
          '1' => record.net_profit,
          '2' => record.description,
          '3' => link_to(content_tag(:i, nil, class: 'fa fa-eye'),  show_details_admin_production_path(record.id),
                        class: 'btn btn-link btn-xs icon-action-link') + link_to(content_tag(:i, nil, class: 'fa fa-pencil'), edit_admin_product_path(record.id),
                        class: 'btn btn-link btn-xs icon-action-link') + link_to(content_tag(:i, nil, class: 'fa fa-remove'),  admin_product_path(record.id), method: :delete,
           data: { confirm: 'Ao remover este registro, todos os dados vinculados a ele serão perdidos. Deseja realmente removê-lo?', :'confirm-button-color' => '#df5640',
                    :'confirm-button-text' => 'Sim', :'cancel-button-text' => 'Não' },
           class: 'btn btn-link btn-xs icon-action-link danger-link'),        
          'DT_RowId' => record.id
      }
    end
  end

  def get_raw_records

      Product.all
     
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
