require "spec_helper"

RSpec.describe Blog, type: :model do
  context  "Column specifications" do
   it {is_expected.to have_db_column(:user_id).of_type(:integer)}
   it {is_expected.to have_db_column(:body).of_type(:text)}
   it {is_expected.to have_db_column(:photo).of_type(:string)}
   it {is_expected.to have_db_column(:created_at).of_type(:datetime)}
   it {is_expected.to have_db_column(:updated_at).of_type(:datetime)}
  end

  context  "Validations" do
    it { is_expected.to validate_presence_of :body }
  end

  context  "Associations" do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to have_many(:comments)}
  end
end
