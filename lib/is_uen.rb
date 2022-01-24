# frozen_string_literal: true

require_relative "is_uen/version"

# Suite of convenience functions to test if a UEN is for a specific entity
module IsUen
  VALID_ENTITIES = %w[lp ll fc pf rf mq mm nb cc cs mb fm gs dp cp nr cm cd md hs vh ch mh cl xl cx hc rp tu tc fb fn
                      pa pb ss mc sm ga gb].freeze

  ENTITY_REGEX = /^(?<year>r|s|t)\d{2}(?<entity>[a-z]{2})\d{4}[a-z]$/.freeze

  def uen?(id)
    business?(id) || company?(id) || new_uen?(id)
  end

  def new_uen?(id)
    ENTITY_REGEX.match(id.downcase) do |match|
      VALID_ENTITIES.include?(match[:entity])
    end
  end

  def business?(id)
    /^\d{8}[a-z]$/i.match?(id)
  end

  def company?(id)
    /^\d{9}[a-z]$/i.match?(id)
  end

  # FIXME: not sure how to effectively test these! will revisit
  VALID_ENTITIES.each do |entity|
    define_singleton_method "#{entity}?" do |id|
      ENTITY_REGEX.match(id.downcase) do |match|
        entity == match[:entity]
      end
    end
  end

  module_function :uen?, :business?, :company?, :new_uen?
end
