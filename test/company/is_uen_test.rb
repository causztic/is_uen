# frozen_string_literal: true

require "test_helper"

class IsUenTest < Minitest::Test
  describe "valid company UEN" do
    let(:uen) { "202212345X" }

    it "is a UEN" do
      assert_true IsUen.uen?(uen)
    end

    it "is not a business" do
      assert_false IsUen.business?(uen)
    end

    it "is a company" do
      assert_true IsUen.company?(uen)
    end

    it "is not a new uen" do
      assert_false IsUen.new_uen?(uen)
    end
  end

  describe "lowercased company UEN" do
    let(:uen) { "202212345x" }

    it "is a UEN" do
      assert_true IsUen.uen?(uen)
    end

    it "is not a business" do
      assert_false IsUen.business?(uen)
    end

    it "is a company" do
      assert_true IsUen.company?(uen)
    end

    it "is not a new uen" do
      assert_false IsUen.new_uen?(uen)
    end
  end

  describe "UEN in the future" do
    # FIXME: this test will fail in 9999 (I'll definitely be dead then!)
    let(:uen) { "999912345A" }

    it "is not a UEN" do
      assert_false IsUen.uen?(uen)
    end

    it "is not a business" do
      assert_false IsUen.business?(uen)
    end

    it "is not a company" do
      assert_false IsUen.company?(uen)
    end

    it "is not a new uen" do
      assert_false IsUen.new_uen?(uen)
    end
  end
end
