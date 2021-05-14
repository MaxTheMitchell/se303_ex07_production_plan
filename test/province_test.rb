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

    it "changes production" do 
      @asia.producers[0].production = 20
      assert_equal(-6, @asia.shortfall)
      assert_equal(292, @asia.profit)
    end

    it 'zero demand' do
      @asia.demand = 0
      assert_equal(-25, @asia.shortfall)
      assert_equal(0, @asia.profit)
    end

    it "negative demand" do
      @asia.demand = -1
      assert_equal(-26, @asia.shortfall)
      assert_equal(-10, @asia.profit)
    end
  end

  describe 'no producers' do
    before do
      data = {
        name: "No proudcers",
        producers: [],
        demand: 30,
        price: 20
      }
      @noProducers = Province.new(data)
    end

    it 'shortfall' do
      assert_equal(30, @noProducers.shortfall)
    end

    it 'profit' do 
      assert_equal(0, @noProducers.profit)
    end
  end
end
