require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "validations" do
    def valid_attributes
      {title: "Real Title", body: "A body goes here"}
    end

    it "requires a title" do
      p0 = Post.create(valid_attributes.merge title: nil)
      p0.valid?
      expect(p0.errors).to have_key(:title)
    end

    it "must have a title longer than 7 characters" do
      p0 = Post.new(valid_attributes.merge(title: "123"))
      p0.valid?
      expect(p0.errors).to have_key(:title)

    end

    it "requires a unique title" do
      Post.create(valid_attributes)
      p1 = Post.new(valid_attributes)
      p1.valid?

      expect(p1.errors).to have_key :title
    end

    it "requires a body" do
      p0 = Post.new valid_attributes.merge body: nil
      p0.valid?
      expect(p0.errors).to have_key(:body)
    end

    it "must have a method, body_snippet, that returns a shortened body" do
      body = Faker::Lorem.characters(99)
      # I appended "abcd" to push it over 100 characters and so I could experiment manualy
      p0 = Post.new(title:"title", body: "#{body}abcd")
      expect(p0.body_snippet).to eq("#{body}...")
    end

    it "must have a method, body_snippet, that doesn't change small body strings " do
      body = Faker::Lorem.characters(99)
      p0 = Post.new(title:"title", body: body)
      expect(p0.body_snippet).to eq(body)
    end

  end
end
