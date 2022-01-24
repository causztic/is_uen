# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "is_uen"

# from: https://github.com/halostatue/minitest-bonus-assertions/blob/master/lib/minitest-bonus-assertions.rb
def assert_true(obj, msg = nil)
  msg = message(msg) { "<true> expected but was #{mu_pp(obj)}" }
  assert obj == true, msg
end

def assert_false(obj, msg = nil)
  msg = message(msg) { "<false> expected but was #{mu_pp(obj)}" }
  assert obj == false, msg
end

require "minitest/autorun"
