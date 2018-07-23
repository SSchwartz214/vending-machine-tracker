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
    dons  = owner.machines.create(location: "Denver")
    skittles = Snack.create(name: "Skittles", price: 1)
    twix = Snack.create(name: "Twix", price: 3)
    VendingMachineSnack.create(machine: dons, snack: skittles)
    VendingMachineSnack.create(machine: dons, snack: twix)

    visit snack_path(skittles)
    expect(page).to have_content("Average price: 2")
  end
  it 'shows count of each snack type' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Denver")
    skittles = Snack.create(name: "Skittles", price: 1)
    skittles_2 = Snack.create(name: "Skittles", price: 1)
    twix = Snack.create(name: "Twix", price: 3)
    VendingMachineSnack.create(machine: dons, snack: skittles)
    VendingMachineSnack.create(machine: dons, snack: twix)

    visit snack_path(skittles)

    expect(page).to have_content("Total types of snacks: 2")
  end
end
