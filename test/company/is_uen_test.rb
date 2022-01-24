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

  describe "lowercased company UEN" do
    let(:uen) { "202212345x" }

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

  describe "UEN in the future" do
    # FIXME: this test will fail in 9999 (I'll definitely be dead then!)
    let(:uen) { "999912345A" }

    it "is not a UEN" do
      refute IsUen.uen?(uen)
    end

    it "is not a business" do
      refute IsUen.business?(uen)
    end

    it "is not a company" do
      refute IsUen.company?(uen)
    end

    it "is not a new uen" do
      refute IsUen.new_uen?(uen)
    end
  end
end
