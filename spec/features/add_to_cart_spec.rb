require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Click the 'Add to Cart' button for a product and the cart increases by one" do
    # ACT
    visit root_path
    find('button.btn-primary', match: :first).click

    # commented out b/c it's for debugging only
    # save_and_open_screenshot('add_to_carts.png')
    # puts page.html

    within('ul.navbar-right') { expect(page).to have_content 'My Cart (1)'}
  end
end
