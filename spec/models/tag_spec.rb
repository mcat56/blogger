require 'rails_helper'

describe Tag, type: :model do
  describe "validations" do
    it {should have_many(:taggings)}
    it {should have_many(:articles).through(:taggings)}
  end
  describe "instance methods" do
    it "returns the name of the tag" do
      tag = Tag.create(name: "Name")
    end
  end 
end
