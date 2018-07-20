require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  it 'displays the name and price of all snacks associated with that vending machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    skittles = Snack.create(name: "Skittles", price: 1)
    VendingMachineSnack.create(machine: dons, snack: skittles)

    visit machine_path(dons)

    expect(page).to have_content("Skittles")
    expect(page).to have_content("Price: #{skittles.price}")
  end
  it 'displays average price of all snacks' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    skittles = Snack.create(name: "Skittles", price: 1)
    twix = Snack.create(name: "Twix", price: 3)
    VendingMachineSnack.create(machine: dons, snack: skittles)
    VendingMachineSnack.create(machine: dons, snack: twix)

    visit machine_path(dons)

    expect(page).to have_content("Average price: 2")
  end
end
