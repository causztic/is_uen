# frozen_string_literal: true

# Suite of convenience functions to test if a UEN is for a specific entity
module IsUen
  VALID_ENTITIES = %w[lp ll fc pf rf mq mm nb cc cs mb fm gs dp cp nr cm cd md hs vh ch mh cl xl cx hc rp tu tc fb fn
                      pa pb ss mc sm ga gb].freeze

  ENTITY_REGEX = /^(?<year>r|s|t)\d{2}(?<entity>[a-z]{2})\d{4}[a-z]$/.freeze

  def uen?(id)
    business?(id) || company?(id)
  end

  def business?(id)
    /^\d{8}[a-z]$/i.match?(id)
  end

  def company?(id)
    /^\d{9}[a-z]$/i.match?(id)
  end

  VALID_ENTITIES.each do |entity|
    define_method "self.#{entity}?" do |id|
      ENTITY_REGEX.match(id.downcase) do |match|
        entity == match[:entity]
      end
    end
  end

  module_function :uen?, :business?, :company?
end
