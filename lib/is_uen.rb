# frozen_string_literal: true

require_relative "is_uen/version"

# Suite of convenience functions to test if a UEN is for a specific entity
module IsUen
  VALID_ENTITIES = %w[LP LL FC PF RF MQ MM NB CC CS MB FM GS DP CP NR CM CD MD HS VH CH MH CL XL
                      CX HC RP TU TC FB FN PA PB SS MC SM GA GB].freeze

  YEARS = { "R" => "18", "S" => "19", "T" => "20" }.freeze
  ENTITY_REGEX = /^(?<year>R|S|T)(?<decade>\d{2})(?<entity>[A-Z]{2})\d{4}[A-Z]$/.freeze

  def uen?(id)
    business?(id) || company?(id) || new_uen?(id)
  end

  def new_uen?(id)
    match = ENTITY_REGEX.match(id)
    return false unless match

    VALID_ENTITIES.include?(match[:entity]) && valid_new_uen_year?(match)
  end

  def business?(id)
    /^\d{8}[A-Z]$/.match?(id)
  end

  def company?(id)
    match = /^(?<year>\d{4})\d{5}[A-Z]$/.match(id)
    return false unless match

    valid_year?(match[:year])
  end

  # FIXME: not sure how to effectively test these! will revisit
  VALID_ENTITIES.each do |entity|
    define_singleton_method "#{entity.downcase}?" do |id|
      match = ENTITY_REGEX.match(id)
      return false unless match

      entity == match[:entity] && valid_new_uen_year?(match)
    end
  end

  def self.valid_new_uen_year?(match)
    year = YEARS[match[:year]] + match[:decade]
    valid_year?(year)
  end

  def self.valid_year?(year_string)
    year_string.to_i <= Time.now.year
  end

  private_class_method :valid_year?, :valid_new_uen_year?
  module_function :uen?, :business?, :company?, :new_uen?
end
