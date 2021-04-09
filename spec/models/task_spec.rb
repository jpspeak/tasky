require 'rails_helper'

RSpec.describe Task, type: :model do
    
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

    # it { expect(subject).to validate_presence_of :name }
end