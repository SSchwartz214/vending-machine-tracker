require 'rails_helper'

describe Snack, type: :model do
  describe 'Class methods' do
    it '.avg_price' do
      skittles = Snack.create(name: "Skittles", price: 1)
      twix = Snack.create(name: "Twix", price: 3)

      expect(Snack.avg_price).to eq(2)
    end
  end
end
