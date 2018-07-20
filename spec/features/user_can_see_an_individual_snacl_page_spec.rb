# As a user
# When I visit a specific snack page
# I see the average price for snacks in those vending machines
# And I see a count of the different kinds of items in that vending machine.
require 'rails_helper'

describe 'When a user visits a snack show page' do
  it 'shows the name and price of that snack' do
    skittles = Snack.create(name: "Skittles", price: 1)

    visit snack_path(skittles)

    expect(page).to have_content("Skittles")
    expect(page).to have_content("Price: #{skittles.price}")
  end
  it 'shows the loations' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    skittles = Snack.create(name: "Skittles", price: 1)
    VendingMachineSnack.create(machine: dons, snack: skittles)

    visit snack_path(skittles)

    expect(page).to have_content("Don's Mixed Drinks")
  end
  it 'shows average price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    skittles = Snack.create(name: "Skittles", price: 1)
    twix = Snack.create(name: "Skittles", price: 3)
    VendingMachineSnack.create(machine: dons, snack: skittles)

    visit snack_path(skittles)

    expect(page).to have_content("Average price: 2")
  end
end
