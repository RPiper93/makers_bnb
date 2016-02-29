describe "User" do

  describe "#authenticate" do
    it "it checks for a valid email and password" do
      user = User.create(first_name: "Sam", last_name: "Morgan", 
                         email: "sam@email.com", password: "Abc123", password_confirmation:"Abc123")
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user 	
    end

  end
end
