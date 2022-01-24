# frozen_string_literal: true

require "test_helper"

class IsUenTest < Minitest::Test
  describe "valid business UEN" do
    let(:uen) { "12345678A" }

    it "is a UEN" do
      assert IsUen.uen?(uen)
    end

    it "is a business" do
      assert IsUen.business?(uen)
    end

    it "is not a company" do
      refute IsUen.company?(uen)
    end

    it "is not a new uen" do
      refute IsUen.new_uen?(uen)
    end
  end

  describe "lowercased business UEN" do
    let(:uen) { "12345678a" }

    it "is a UEN" do
      assert IsUen.uen?(uen)
    end

    it "is a business" do
      assert IsUen.business?(uen)
    end

    it "is not a company" do
      refute IsUen.company?(uen)
    end

    it "is not a new uen" do
      refute IsUen.new_uen?(uen)
    end
  end
end
