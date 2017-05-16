require_relative 'test_helper.rb'

describe "tick test" do
  before do
    @item = GildedRose.new("myitem", 7, 10)
    @brie_item = GildedRose.new("Aged Brie", 7, 10)
  end

  it "has a quality which decreases" do
    @item.tick
    @item.quality.must_equal 9
  end

  it "has a sell_in date which decreases" do
    @item.tick
    @item.days_remaining.must_equal 6
  end

  it "never has neg quality" do
    1.upto(20) do @item.tick end;
    @item.quality.must_equal 0
  end

  it "never more than 50 quality" do
    1.upto(50) do @brie_item.tick end;
    assert @brie_item.quality <= 50, "quality is #{@brie_item.quality}, expected 50"
  end

  it "increases with age if brie" do
    @brie_item.tick
    @brie_item.quality.must_equal 11
  end
end
