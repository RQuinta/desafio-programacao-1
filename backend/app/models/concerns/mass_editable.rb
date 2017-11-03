module MassEditable
  extend ActiveSupport::Concern

  included do
    cattr_accessor :mass_edit_errors
  end

  class_methods do
    def mass_edit resources

      unless validate_resources resources
        return false
      end

      transaction do
        create_resources! resources
      end
    end

    protected

    def validate_resources resources
      @@mass_edit_errors = []
      resources.each do |resource|
        unless resource.valid?
          @@mass_edit_errors << resource.errors.messages
        end
      end

      @@mass_edit_errors.empty?
    end

    def create_resources! resources

      resources.each do |resource|
        resource.save || (raise ActiveRecord::Rollback)
      end
    end

  end
end
