module IssuePatch
  def self.included(base)
    base.class_eval do
      unloadable

      safe_attributes :tipo_bonocredito, :bonocreditos
    end
  end
end
