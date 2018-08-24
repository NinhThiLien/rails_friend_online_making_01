require "spec_helper"

RSpec.describe Birthday, type: :model do
  context  "Column specifications" do
   it {is_expected.to have_db_column(:birthday).of_type(:date)}
   it {is_expected.to have_db_column(:status).of_type(:boolean)}
   it {is_expected.to have_db_column(:user_id).of_type(:integer)}
   it {is_expected.to have_db_column(:created_at).of_type(:datetime)}
   it {is_expected.to have_db_column(:updated_at).of_type(:datetime)}
 end

  let(:user) { User.new(name: "test_name", password: "test_password") }

  subject {
    described_class.new(birthday: "29-01-1996", user: user)
  }

  context  "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a birthday" do
      subject.birthday = nil
      expect(subject).to be_valid
    end
  end

  context  "Associations" do
    it {is_expected.to belong_to(:user)}
  end
end
