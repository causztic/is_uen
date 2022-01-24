# frozen_string_literal: true

require "test_helper"

class IsUenTest < Minitest::Test
  describe "version" do
    it "has a version number" do
      refute_nil IsUen::VERSION
    end
  end

  describe "VALID_ENTITIES" do
    it "has the correct entity codes" do
      assert_equal IsUen::VALID_ENTITIES, %w[LP LL FC PF RF MQ MM NB CC CS MB FM GS DP CP NR CM CD MD HS VH CH MH CL XL
                                             CX HC RP TU TC FB FN PA PB SS MC SM GA GB].map(&:downcase)
    end
  end
end
