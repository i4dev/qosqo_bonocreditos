module IssueQueryPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      unloadable
      alias_method_chain :available_filters, :bonocreditos
      base.add_available_column(QueryColumn.new(:tipo_bonocredito, :sortable => "#{Issue.table_name}.tipo_bonocredito", :default_order => 'asc', :caption => 'Tipo Bonocredito', :groupable => true))
      base.add_available_column(QueryColumn.new(:bonocreditos, :sortable => "#{Issue.table_name}.bonocreditos", :default_order => 'asc', :caption => 'Bonocreditos', :groupable => false))
    end
  end

  module InstanceMethods
    def available_filters_with_bonocreditos
      available_filters_without_bonocreditos
      if User.current.allowed_to?(:view_bonocreditos, project)
        @available_filters['tipo_bonocredito'] = { type: :list, name: "Tipo Bonocredito", values: ["Conferencias y Congresos", "Responsabilidad Social", "Semana de la Ingeniería"] }
        @available_filters['bonocreditos'] = { type: :integer, name: "Bonocreditos" }
      end
      @available_filters
    end
  end

end
