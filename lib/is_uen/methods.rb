# frozen_string_literal: true

# https://www.uen.gov.sg/ueninternet/faces/pages/admin/aboutUEN.jspx
module IsUen
  VALID_ENTITIES = %w[LP LL FC PF RF MQ MM NB CC CS MB FM GS DP CP NR CM CD MD HS VH CH MH CL XL CX HC RP TU TC FB FN
                      PA PB SS MC SM GA GB].freeze

  def uen?(id)
    business?(id) || company?(id)
  end

  def business?(id)
    /^\d{8}[a-z]$/i.match?(id)
  end

  def company?(id)
    /^\d{9}[a-z]$/i.match?(id)
  end

  def new_uen?(id:, entities: VALID_ENTITIES)
    upcased_id = id.upcase
    /^(?<year>R|S|T)\d{2}(?<entity>[A-Z]{2})\d{4}[A-Z]$/.match(upcased_id) do |match|
      entities.include?(match[:entity])
    end
  end

  module_function :uen?, :business?, :company?, :new_uen?
end
