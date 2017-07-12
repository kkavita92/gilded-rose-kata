require './gilded_rose'

describe GildedRose do

  describe 'normal items ' do
    it 'should reduce quality by 1 per day' do
      items = [Item.new('normal', 10, 10)]
      expect{ GildedRose.new(items).update_quality }.to change { items[0].quality }.by(-1)
    end

    it 'should have minimum quality of 0' do
      items = [Item.new('normal', 10, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it 'should degrade by 2 when sell-by date has passed' do
      items = [Item.new('normal', 0, 10)]
      expect{ GildedRose.new(items).update_quality }.to change { items[0].quality }.by(-2)
    end
  end

  describe 'aged brie' do
    it 'should increase quality by 1 per day' do
      items = [Item.new('Aged Brie', 10, 10)]
      expect{ GildedRose.new(items).update_quality }.to change { items[0].quality }.by(1)
    end

    it 'should have maximum quality of 50' do
      items = [Item.new('Aged Brie', 10, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end
  end

  describe 'backstage passes' do
  end

end
