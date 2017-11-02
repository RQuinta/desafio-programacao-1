module MassEditable
  extend ActiveSupport::Concern

  included do
    attr_accessor :_remove
    attr_accessor :mass_edit_id
    cattr_accessor :mass_edit_errors
  end

  class_methods do
    def mass_edit attributes
      create_resources attributes

      unless validate_resources
        return false
      end

      transaction do
        destroy_resources!
        update_resources!
      end
    end

    protected

    def validate_resources
      @@mass_edit_errors = {}
      @@resources_to_update.each do |resource|
        unless resource.valid?
          @@mass_edit_errors[resource.mass_edit_id] = resource.errors.messages
        end
      end

      @@mass_edit_errors.empty?
    end

    def create_resources attributes
      @@resources_to_update = []
      @@resources_to_destroy = []

      attributes.each do |id, attributes|
        resource = find_by_id(id) || new
        resource.assign_attributes mass_edit_strong_parameters(attributes)
        next if resource.new_record? && remove_resource?(resource)

        resource.mass_edit_id = id

        if remove_resource?(resource)
          @@resources_to_destroy << resource
        else
          @@resources_to_update << resource
        end
      end
    end

    def destroy_resources!
      @@resources_to_destroy.each do |resource|
        if !resource.destroy
          (@@mass_edit_errors[resource.id] ||= {})[:_remove] = resource.errors[:_remove]
          raise ActiveRecord::Rollback
        end
      end
    end

    def update_resources!
      @@resources_to_update.each do |resource|
        resource.save || (raise ActiveRecord::Rollback)
      end
    end

    def mass_edit_strong_parameters attributes
      raise NotImplementedError, 'Sorry, you have to override mass_edit_strong_parameters'
    end

    def remove_resource? resource
      resource._remove && !resource._remove.empty?
    end
  end
end
