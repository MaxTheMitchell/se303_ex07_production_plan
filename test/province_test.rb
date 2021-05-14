gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/province'
require_relative '../lib/data'

class ProvinceTest < Minitest::Test

  describe "province" do 
    before { @asia = Province.new(sample_province_data) } 

    it "shortfall" do
      assert_equal(5, @asia.shortfall)
    end

    it "profit" do 
      assert_equal(230, @asia.profit)
    end
  end
end
