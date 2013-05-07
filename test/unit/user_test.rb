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
  	user.profile_name = users(:ciaran).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "user should have profile name without spaces" do
  	user = User.new
  	user.profile_name = "Profile Name with Spaces"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end
end
