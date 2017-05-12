require_relative 'test_helper.rb'

describe "tick test" do
  before do
    @item = GildedRose.new("myitem", 7, 10)
  end

  it "has a quality which decreases" do
    @item.tick
    @item.quality.must_equal 9
  end

  it "has a sell_in date which decreases" do
    @item.tick
    @item.sell_in.must_equal 6
  end
end
