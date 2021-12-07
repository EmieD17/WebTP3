require "test_helper"

class UserTest < ActiveSupport::TestCase

    test "Should not save user without email" do
        user = User.new
        assert_not user.save, "Saved the user without an email"
    end

    test "Should save valid user" do
        user = User.new(nom: "Paul", prenom: "Tremblay", email: "paul@tremblay.com", password: "123456")

        assert user.save, "Save the valid user failed"
    end

    test "Should not save user without a valid email" do
        user = User.new(email:"123456")
    
        assert_not user.save, "Saved the user without valid email"
    end

    test "Should not save user with same email" do
        user = User.new(nom: "Paul", prenom: "Tremblay", email: "paul@tremblay.com", password: "123456")
        user.save

        user2 = User.new(nom: "Paula", prenom: "Tremblay", email: "paul@tremblay.com", password: "123456")
    
        assert_not user2.save, "Saved the user with same email"
    end

    test "Should update user successfully" do 

        paul = User.create!(nom: "Paul", prenom: "Tremblay", email: "paul@tremblay.com", password: "123456")

        assert paul.update(nom: "newNom", email: "newNom@tremblay.com"), "Can't update user"
        
    end

    test "Should delete user successfully" do 

        user = User.create!(nom: "Paul", prenom: "Tremblay", email: "paul@tremblay.com", password: "123456")

        assert user.delete, "Can't delete user"
        
    end

end