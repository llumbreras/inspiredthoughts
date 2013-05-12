require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user enter first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "user enters last_name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "user enters profile_name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "user has unique profile name" do
  	user = User.new
  	user.profile_name = users(:foo).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "user should have profile name without spaces" do
    user = User.new(first_name: 'Foo', last_name: 'Bar', email: 'foo.bar@example.org')
    user.password = user.password_confirmation = 'passw0rd'
  	user.profile_name = "Profile Name with Spaces"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "user has correctly formatted profile name" do
    user = User.new(first_name: 'Foo', last_name: 'Bar', email: 'foo.bar@example.org')
    user.password = user.password_confirmation = 'password'
    user.profile_name = 'foobar_2000'
    assert user.valid?
  end
end
