require 'rails_helper'

RSpec.describe FormEntry, type: :model do
  it "is valid with valid attributes" do
    form_entry = FormEntry.new(name: "El pepe", age: 30, email: "john@example.com", phone: "1234567890", birthdate: Date.today)
    expect(form_entry).to be_valid
  end

  it "is not valid without a name" do
    form_entry = FormEntry.new(name: nil)
    expect(form_entry).to_not be_valid
  end

  it "is not valid if the name is less than 3 characters" do
    form_entry = FormEntry.new(name: "Al")
    expect(form_entry).to_not be_valid
  end

  it "is not valid if age is not an integer" do
    form_entry = FormEntry.new(name: "El pepe", age: "twenty", email: "john@example.com", phone: "1234567890", birthdate: Date.today)
    expect(form_entry).to_not be_valid
  end

  it "is not valid if age is less than 0" do
    form_entry = FormEntry.new(name: "El pepe", age: -1, email: "john@example.com", phone: "1234567890", birthdate: Date.today)
    expect(form_entry).to_not be_valid
  end

  it "is not valid without an email" do
    form_entry = FormEntry.new(name: "El pepe", email: nil)
    expect(form_entry).to_not be_valid
  end

  it "is not valid with an improperly formatted email" do
    form_entry = FormEntry.new(name: "El pepe", email: "johnexample.com")
    expect(form_entry).to_not be_valid
  end

  it "is not valid without a phone number" do
    form_entry = FormEntry.new(name: "El pepe", phone: nil)
    expect(form_entry).to_not be_valid
  end

  it "is not valid if the phone number is not exactly 10 digits" do
    form_entry = FormEntry.new(name: "El pepe", phone: "12345")
    expect(form_entry).to_not be_valid
  end

  it "is not valid without a birthdate" do
    form_entry = FormEntry.new(name: "El pepe", birthdate: nil)
    expect(form_entry).to_not be_valid
  end
end
