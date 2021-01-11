require 'rails_helper'

# Here are the things to test for in this model's validations:

# It must be created with a password and password_confirmation fields
# These need to match so you should have an example for where they are not the same
# These are required when creating the model so you should also have an example for this
# Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
# Email, first name, and last name should also be required

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a new user' do
      user = User.create(email: "test@test.com")
      puts user.inspect
      expect(user).not_to be_nil
    end

    it 'should validate the new user\'s password and password_confirmation fields' do
      user1 = User.create(name: "Test Name", email: "test1@test.com", password: nil, password_confirmation: nil)
      puts user1.errors.full_messages
      assert_equal(["Password can't be blank"], user1.errors.full_messages)

      user2 = User.create(name: "Test Name", email: "test2@test.com", password: "test_password", password_confirmation: "password")
      puts user2.errors.full_messages
      assert_equal(["Password confirmation doesn't match Password"], user2.errors.full_messages)
    end

    it 'should validate that the email is unique, not case sensitive' do
      user1 = User.create(name: "Test Name", email: "test3@test.COM", password: "test_password", password_confirmation: "test_password")

      user2 = User.create(name: "Test Name", email: "TEST3@TEST.com", password: "test_password", password_confirmation: "test_password")
      puts user2.errors.full_messages
      assert_equal(["Email has already been taken"], user2.errors.full_messages)
    end

    it 'should validate the presence of mail and name' do
      user1 = User.create(name: nil, email: "test3@test.COM", password: "test_password", password_confirmation: "test_password")
      puts user1.errors.full_messages
      assert_equal(["Name can't be blank"], user1.errors.full_messages)

      user2 = User.create(name: "Test Name", email: nil, password: "test_password", password_confirmation: "test_password")
      puts user2.errors.full_messages
      assert_equal(["Email can't be blank"], user2.errors.full_messages)
    end

  end
end
