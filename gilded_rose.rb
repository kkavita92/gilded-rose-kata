class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == 'normal'
        update_normal_item(item)
      elsif item.name == 'Aged Brie'
        update_aged_brie(item)
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        update_backstage_passes(item)
      end
    end
  end

  private

  def update_normal_item(item)
    update_sell_in(item)
    item.quality -= 1 unless item.quality == 0
    item.quality -= 1 if item.sell_in <= 0
  end

  def update_aged_brie(item)
    update_sell_in(item)
    item.quality += 1 unless item.quality >= 50
    item.quality += 1 if item.sell_in <= 0
  end

  def update_backstage_passes(item)
    update_sell_in(item)
    return if item.quality >= 50
    return item.quality = 0 if item.sell_in < 0

    item.quality += 1
    item.quality += 1 if item.sell_in < 10
    item.quality += 1 if item.sell_in < 5
  end

  def update_sell_in(item)
    item.sell_in -= 1
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
