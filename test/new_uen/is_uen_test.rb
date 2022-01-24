# frozen_string_literal: true

require "test_helper"

class IsUenTest < Minitest::Test
  describe "UEN with R" do
    let(:uen) { "R12LP1234X" }

    it "is a new UEN" do
      assert IsUen.new_uen?(uen)
    end

    it "is a UEN" do
      assert IsUen.uen?(uen)
    end
  end

  describe "UEN with S" do
    let(:uen) { "S12LP1234X" }

    it "is a new UEN" do
      assert IsUen.new_uen?(uen)
    end

    it "is a UEN" do
      assert IsUen.uen?(uen)
    end
  end

  describe "UEN with T" do
    let(:uen) { "T12LP1234X" }

    it "is a new UEN" do
      assert IsUen.new_uen?(uen)
    end

    it "is a UEN" do
      assert IsUen.uen?(uen)
    end
  end

  describe "UEN with U" do
    let(:uen) { "U12LP1234X" }

    it "is not a new UEN" do
      refute IsUen.new_uen?(uen)
    end

    it "is not a UEN" do
      refute IsUen.uen?(uen)
    end
  end

  describe "lowercased UEN" do
    let(:uen) { "r12lp1234x" }

    it "is a new UEN" do
      assert IsUen.new_uen?(uen)
    end

    it "is a UEN" do
      assert IsUen.uen?(uen)
    end
  end

  describe "UEN in the future" do
    # FIXME: this test will fail in 2099 (I'll probably be dead then!)
    let(:uen) { "t99lp1234x" }

    it "is not a new UEN" do
      refute IsUen.new_uen?(uen)
    end

    it "is not a UEN" do
      refute IsUen.uen?(uen)
    end
  end
end
