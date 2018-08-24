require "spec_helper"

RSpec.describe Desire, type: :model do
  context  "Column specifications" do
   it {is_expected.to have_db_column(:description).of_type(:text)}
   it {is_expected.to have_db_column(:status).of_type(:boolean)}
   it {is_expected.to have_db_column(:user_id).of_type(:integer)}
   it {is_expected.to have_db_column(:genre).of_type(:integer)}
   it {is_expected.to have_db_column(:age_min).of_type(:integer)}
   it {is_expected.to have_db_column(:age_max).of_type(:integer)}
   it {is_expected.to have_db_column(:height_min).of_type(:integer)}
   it {is_expected.to have_db_column(:height_max).of_type(:integer)}
   it {is_expected.to have_db_column(:weight_min).of_type(:integer)}
   it {is_expected.to have_db_column(:weight_max).of_type(:integer)}
   it {is_expected.to have_db_column(:created_at).of_type(:datetime)}
   it {is_expected.to have_db_column(:updated_at).of_type(:datetime)}
 end

  let(:user) { User.new(name: "test_name", password: "test_password") }

  subject {
    described_class.new(description: "dep", genre: 1, age_min: 18, age_max: 25,
      weight_min: 43, weight_max: 48, height_min: 158, height_max: 170, user: user)
  }

  context  "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end

  context  "Associations" do
    it {is_expected.to belong_to(:user)}
  end
end
