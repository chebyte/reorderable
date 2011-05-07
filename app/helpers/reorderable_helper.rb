module ReorderableHelper
  def reorderable_attributes(collection, reorder_column='position')
    unless collection.empty?
      " class='reorderable' data-reorder-url='#{url_for(:controller => "admin/#{collection.first.class.to_s.tableize}", :action => 'reorder', :only_path => true)}' data-reorder-column='#{reorder_column}'"
    end
  end
end
