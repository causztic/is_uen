# frozen_string_literal: true

require "test_helper"

class IsUenTest < Minitest::Test
  describe "valid business UEN" do
    let(:uen) { "12345678A" }

    it "is a UEN" do
      assert_true IsUen.uen?(uen)
    end

    it "is a business" do
      assert_true IsUen.business?(uen)
    end

    it "is not a company" do
      assert_false IsUen.company?(uen)
    end

    it "is not a new uen" do
      assert_false IsUen.new_uen?(uen)
    end
  end
end
