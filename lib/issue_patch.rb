module IssuePatch
  def self.included(base)
    base.class_eval do
      unloadable
      validates :bonocreditos, :numericality => { :message => "tiene que ser numerico."}
      validates :bonocreditos, :numericality => {:greater_than_or_equal_to => 0, :message => "tiene que ser mayor o igual a 0."}
      validates :bonocreditos, :numericality => {:less_than_or_equal_to => 3, :message => "tiene que ser menor o igual a 3."}
      safe_attributes :tipo_bonocredito, :bonocreditos
    end
  end
end
