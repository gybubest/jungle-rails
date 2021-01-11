require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a new user' do
      user = User.create(email: "test@test.com")
      expect(user).not_to be_nil
    end

    it 'should validate the new user\'s password and password_confirmation fields' do
      user1 = User.create(name: "Test Name", email: "test1@test.com", password: nil, password_confirmation: "test_password")
      assert_equal(["Password can't be blank", "Password is too short (minimum is 5 characters)", "Password can't be blank"], user1.errors.full_messages)

      user2 = User.create(name: "Test Name", email: "test2@test.com", password: "test_password", password_confirmation: "password")
      assert_equal(["Password confirmation doesn't match Password"], user2.errors.full_messages)
    end

    it 'should validate that the email is unique, not case sensitive' do
      user1 = User.create(name: "Test Name", email: "test3@test.COM", password: "test_password", password_confirmation: "test_password")

      user2 = User.create(name: "Test Name", email: "TEST3@TEST.com", password: "test_password", password_confirmation: "test_password")
      assert_equal(["Email has already been taken"], user2.errors.full_messages)
    end

    it 'should validate the presence of mail and name' do
      user1 = User.create(name: nil, email: "test1@test.com", password: "test_password", password_confirmation: "test_password")
      assert_equal(["Name can't be blank"], user1.errors.full_messages)

      user2 = User.create(name: "Test Name", email: nil, password: "test_password", password_confirmation: "test_password")
      assert_equal(["Email can't be blank"], user2.errors.full_messages)
    end

    it 'should validate the minimum password length is 5' do
      user1 = User.create(name: "Test Name", email: "test1@test.com", password: "test", password_confirmation: "test")
      assert_equal(["Password is too short (minimum is 5 characters)"], user1.errors.full_messages)

      user2 = User.create(name: "Test Name", email: "test1@test.com", password: "test_password", password_confirmation: "test_password")
      puts user2.inspect
      expect(user2.id).not_to be_nil
    end

  end
end
