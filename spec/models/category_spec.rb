require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    it "requires a title" do
      c = Category.new(title: nil)
      c.valid?
      expect(c.errors).to have_key :title
    end
    it "must be a unique category" do
      Category.create(title: "sample title")
      c = Category.new(title: "sample title")

      c.valid?

      expect(c.errors).to have_key :title

    end
  end
end
