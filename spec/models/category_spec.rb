require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    it "requires a title" do
      c = category.new(title: nil)
      c.valid?
      expect(c.errors).to have_key :title
    end
    it "must be a unique category" do
      Campaign.create(title: "sample title")
      c = Campaign.new(title: "sample title")

      c.valid?

      expect(c.errors).to have_key :title

    end
  end
end
