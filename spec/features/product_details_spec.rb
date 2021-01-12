require 'rails_helper'

RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do
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

  scenario "They see all product details" do
    # ACT
    visit root_path
    visit '/products/1'

    # commented out b/c it's for debugging only
    # save_and_open_screenshot('product_details.png')
    # puts page.html

    expect(page).to have_css 'article.product-detail'
  end

end