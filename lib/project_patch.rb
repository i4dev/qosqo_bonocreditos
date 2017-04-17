module ProjectPatch
  def self.included(base)
    base.class_eval do
      unloadable

      safe_attributes :bonocredito_tracker_id
    end
  end
end
