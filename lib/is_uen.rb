# frozen_string_literal: true

require_relative "is_uen/version"

# Suite of convenience functions to test if a UEN is for a specific entity
module IsUen
  VALID_ENTITIES = %w[lp ll fc pf rf mq mm nb cc cs mb fm gs dp cp nr cm cd md hs vh ch mh cl xl cx hc rp tu tc fb fn
                      pa pb ss mc sm ga gb].freeze

  YEARS = { "r" => "18", "s" => "19", "t" => "20" }.freeze
  ENTITY_REGEX = /^(?<year>r|s|t)(?<decade>\d{2})(?<entity>[a-z]{2})\d{4}[a-z]$/.freeze

  def uen?(id)
    business?(id) || company?(id) || new_uen?(id)
  end

  def new_uen?(id)
    ENTITY_REGEX.match(id.downcase) do |match|
      VALID_ENTITIES.include?(match[:entity]) && valid_new_uen_year?(match)
    end
  end

  def business?(id)
    /^\d{8}[a-z]$/i.match?(id)
  end

  def company?(id)
    /^(?<year>\d{4})\d{5}[a-z]$/i.match(id) do |match|
      valid_year?(match[:year])
    end
  end

  # FIXME: not sure how to effectively test these! will revisit
  VALID_ENTITIES.each do |entity|
    define_singleton_method "#{entity}?" do |id|
      ENTITY_REGEX.match(id.downcase) do |match|
        entity == match[:entity] && valid_new_uen_year?(match)
      end
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
