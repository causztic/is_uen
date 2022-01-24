# frozen_string_literal: true

require "active_model/validator"
require_relative "methods"

# ActiveModel validator for UEN
class UenValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    entities = options[:in]

    record.errors.add(attribute, "is not a valid UEN") unless uen?(id: value, entities: entities)
  end

  private

  def uen?(id:, entities:)
    IsUen.uen?(id) || IsUen.new_uen?(id: id, entities: entities)
  end
end
