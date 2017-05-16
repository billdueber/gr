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
    @item.days_remaining.must_equal 6
  end

  it "quality does not go negative" do

    digits = 0..100

    digits.each do |digit|
      @item.tick
    end
    @item.quality.must_equal 0
  end

    it "quality is more than 50" do

    @item.quality = 102
    @item.tick
    @item.quality.must_equal 50
  end

end


