# Jungle

A mini e-commerce application built with Rails 4.2.

Features:
1. Users can sign up/log in from any page. The app keeps the session and show the user name on the nav bar after login.
2. Users can view product details, add products to the cart and pay for the order. The payment module will be invisible if the cart is empty.
3. Admin authentication: only the admin has access to adding new products and categories.
4. The 'Sold Out' badge will be shown if there's 0 products in stock, and the 'Add To Cart' button will be hidden.


## Final Product

- Home Page
!["Home Page"]()

- Cart
!["Cart"]()

- Add new category
!["Add new category"]()

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Bcrypt
* Money-rails
* Faker
* Capybara
* Poltergeist
* Database_cleaner
