# frozen_string_literal: true

require "test_helper"

def sample_uen(code)
  "T12#{code}1234X"
end

class IsNewUenTest < Minitest::Test
  describe "with no entity input" do
    it "checks against the default list" do
      IsUen::VALID_ENTITIES.each do |entity|
        assert IsUen.new_uen?(id: sample_uen(entity))
      end
    end

    it "is false if not in default list" do
      invalid_code = "ZZ"

      refute IsUen::VALID_ENTITIES.include?(invalid_code)
      refute IsUen.new_uen?(id: sample_uen(invalid_code))
    end
  end

  describe "with custom entities" do
    let(:uen) { sample_uen("ZZ") }

    it "is true if inside custom entities" do
      assert IsUen.new_uen?(id: uen, entities: %w[AA ZZ])
    end

    it "is false if not inside custom entities" do
      refute IsUen.new_uen?(id: uen, entities: ["LL"])
    end
  end
end
