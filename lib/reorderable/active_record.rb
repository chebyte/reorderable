module Reorderable
  module ActiveRecord
    extend ActiveSupport::Concern

    module ClassMethods
      def reorderable(opts={})
        sortable(opts)
        column = sortable_lists[opts[:column].to_s][:column]
        default_scope(order("#{column} asc")) if opts[:list_name].blank?
      end

      # Reorder entries based on the order of the IDs passed in
      def reorder!(klass, ids = [], options = {})
        klass.where("id in (?)", ids).each do |p|
          p.update_attribute(options[:column], ids.index(p.id.to_s) || 0)
        end
      end
    end # ClassMethods
  end # ActiveRecord
end # Reorderable

ActiveRecord::Base.class_eval { include Reorderable::ActiveRecord }
