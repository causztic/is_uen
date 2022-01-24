# frozen_string_literal: true

require "test_helper"
require "active_model"

class ValidatorTest < Minitest::Test
  class SampleClass
    include ActiveModel::Validations

    attr_accessor :uen

    validates :uen, uen: true

    def initialize(uen)
      @uen = uen
    end
  end

  describe "invalid UEN" do
    it "is invalid" do
      object = SampleClass.new("123")

      refute object.valid?
    end
  end

  describe "valid UEN" do
    it "is valid with business UEN" do
      object = SampleClass.new("12312312A")

      assert object.valid?
    end

    it "is valid with company UEN" do
      object = SampleClass.new("123123123A")

      assert object.valid?
    end
  end
end
