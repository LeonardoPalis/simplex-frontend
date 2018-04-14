class TypeResourceDatatable < AjaxDatatablesRails::Base
 
 def_delegators :@view, :link_to, :admin_type_resource_path, :edit_admin_type_resource_path , :show_details_admin_production_path,  :content_tag

  def searchable_columns
  @searchable_columns ||= [
     'TypeResource.name'

  ]
end

def sortable_columns
  @sortable_columns ||= [

    'TypeResource.name'
  ]
end

  private

  def data
    
    records.map do |record|
     {

          '0' => record.name,
          '1' => record.max_quantity,
          '2' => link_to(content_tag(:i, nil, class: 'fa fa-pencil'),  edit_admin_type_resource_path(record.id),
                        class: 'btn btn-link btn-xs icon-action-link') + link_to(content_tag(:i, nil, class: 'fa fa-remove'),   admin_type_resource_path(record.id), method: :delete,
           data: { confirm: 'Ao remover este registro, todos os dados vinculados a ele serão perdidos. Deseja realmente removê-lo?', :'confirm-button-color' => '#df5640',
                    :'confirm-button-text' => 'Sim', :'cancel-button-text' => 'Não' },
           class: 'btn btn-link btn-xs icon-action-link danger-link'),        
          'DT_RowId' => record.id
      }
    end
  end

  def get_raw_records

      TypeResource.all
     
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
