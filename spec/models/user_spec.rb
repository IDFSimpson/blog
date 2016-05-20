require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    def valid_attributes
      {first_name: "Joe", last_name: "Blogs", email: "email@hotmail.com", password: "supersecret"}
    end

    it "requires a first_name" do
      u = User.new(valid_attributes.merge first_name: nil)
      u.valid?
      expect(u.errors).to have_key(:first_name)
    end

    it "requires a last_name" do
      u = User.new(valid_attributes.merge last_name: nil)
      u.valid?
      expect(u.errors).to have_key(:last_name)
    end

    it "requires a email" do
      u = User.new(valid_attributes.merge email: nil)
      u.valid?
      expect(u.errors).to have_key(:email)
    end
    it "requires a email with an @" do
      u = User.new(valid_attributes.merge email: "not_a_real_email")
      u.valid?
      expect(u.errors).to have_key(:email)
    end
    it "requires a unique email" do
      User.create(valid_attributes)
      e = User.new(valid_attributes)
      e.valid?

      expect(e.errors).to have_key :email
    end

    it "requires a password" do
      u = User.new(valid_attributes.merge password: nil)
      u.valid?
      expect(u.errors).to have_key(:password)
    end

    it "hashes the password" do
      pass = "supersecret"
      u = User.new(valid_attributes.merge password: pass)
      expect(u.password_digest).not_to eq(pass)
    end
  end

end
