require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should create a new product' do
      cat = Category.create(id: 1)
      product = Product.create(name: 'Men\'s Classy shirt', quantity: 1, price: 64.9, category: cat)
      expect(product).not_to be_nil
    end

    it 'should validate a new product\'s name' do
      cat = Category.create(id: 1)
      product = Product.create(name: nil, quantity: 10, price: 1000, category: cat)
      expect(product.name).to be_nil

      puts product.errors.full_messages
      assert_equal(["Name can't be blank"], product.errors.full_messages)
    end

    it 'should validate a new product\'s quantity' do
      cat = Category.create(id: 1)
      product = Product.create(name: 'Women\'s Classy dress', quantity: nil, price: 1000, category: cat)
      expect(product.quantity).to be_nil

      puts product.errors.full_messages
      assert_equal(["Quantity can't be blank"], product.errors.full_messages)
    end

    it 'should validate a new product\'s price' do
      cat = Category.create(id: 1)
      product = Product.create(name: 'Women\'s Classy dress', quantity: 10, price: nil, category: cat)
      expect(product.price).to be_nil

      puts product.errors.full_messages
      assert_equal(["Price cents is not a number", "Price is not a number", "Price can't be blank"], product.errors.full_messages)
    end

    it 'should validate a new product\'s category' do
      cat = Category.create(id: 1)
      product = Product.create(name: 'Women\'s Classy dress', quantity: 10, price: 1000, category: nil)
      expect(product.category).to be_nil

      puts product.errors.full_messages
      assert_equal(["Category can't be blank"], product.errors.full_messages)
    end

  end
end