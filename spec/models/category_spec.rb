require 'rails_helper'

RSpec.describe Category, type: :model do
    describe "#validations" do
        it "should return false if name is blank" do
            category = Category.new(name: "")
            expect(category.save).to eq false
        end
        it "should return true if name is not blank" do
            category = Category.new(name: "foo")
            expect(category.save).to eq true
        end
    end

    describe "#Associations" do
        context "When category is deleted" do 
            it "should delete all its tasks" do 
                category = Category.create(name: "foo")
                category.tasks.create(name: "bar")
                category.destroy
                expect(Task.find_by category_id: category.id).to eq nil
            end
        end
    end

    # it { expect(subject).to validate_presence_of :name }
end