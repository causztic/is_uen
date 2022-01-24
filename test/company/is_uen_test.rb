# frozen_string_literal: true

require "test_helper"

class IsUenTest < Minitest::Test
  describe "valid company UEN" do
    let(:uen) { "202212345X" }

    it "is a UEN" do
      assert IsUen.uen?(uen)
    end

    it "is not a business" do
      refute IsUen.business?(uen)
    end

    it "is a company" do
      assert IsUen.company?(uen)
    end

    it "is not a new uen" do
      refute IsUen.new_uen?(uen)
    end
  end
end
