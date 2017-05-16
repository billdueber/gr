require_relative 'test_helper.rb'

describe "tick test" do
  before do
    @item = GildedRose.new("myitem", 7, 10)
  end

  it 'cannot have a negative quality' do
    20.times {@item.tick}
    @item.quality.must_equal 0
  end

  describe "after one tick" do
    before do
      @item.tick
    end

    it "has a quality which decreases" do
      @item.quality.must_equal 9
    end

    it "has a sell_in date which decreases" do
      @item.days_remaining.must_equal 6
    end

    describe "then a second tick" do
      before do
        @item.tick
      end

      it "has a quality which decreases again" do
        @item.quality.must_equal 8
      end

      it "has a sell_in date which decreases again" do
        @item.days_remaining.must_equal 5
      end
    end
  end
end

describe "aged brie" do
  before do
    @item = GildedRose.new("Aged Brie", 7, 10)
  end

  it "increases in quality over time" do
    @item.tick
    @item.quality.must_equal 11
  end

  it "increases in quality over more time" do
    @item.tick
    @item.tick
    @item.quality.must_equal 12
  end

  it "doesn't increase past 50" do
    50.times {@item.tick}
    @item.quality.must_equal 50
  end
end
