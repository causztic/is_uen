# frozen_string_literal: true

require "test_helper"
require "active_model"

class ValidatorWithEntityTest < Minitest::Test
  class SampleClass
    include ActiveModel::Validations

    attr_accessor :uen

    validates :uen, uen: %w[ZZ]

    def initialize(uen)
      @uen = uen
    end
  end

  describe "validator with custom entity list" do
    it "is valid if entity is in list" do
      object = SampleClass.new("T12ZZ1234A")

      assert object.valid?
    end

    it "is valid if valid business UEN" do
      object = SampleClass.new("12345678A")

      assert object.valid?
    end

    it "is valid if valid company UEN" do
      object = SampleClass.new("123456789A")

      assert object.valid?
    end

    it "is invalid if entity is not in list" do
      object = SampleClass.new("T12AA1234A")

      refute object.valid?
    end
  end
end
