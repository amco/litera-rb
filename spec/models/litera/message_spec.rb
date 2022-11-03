# frozen_string_literal: true

require "rails_helper"

RSpec.describe Litera::Message, type: :model do
  describe "Database columns" do
    it { is_expected.to have_db_column(:body).of_type(:jsonb).with_options(default: {}) }
    it { is_expected.to have_db_column(:metadata).of_type(:jsonb).with_options(default: {}) }
    it { is_expected.to have_db_column(:service).of_type(:string) }
    it { is_expected.to have_db_column(:external_id).of_type(:string) }
    it { is_expected.to have_db_column(:published_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:service) }
    it { is_expected.to validate_presence_of(:metadata) }
    it { is_expected.to validate_presence_of(:external_id) }
    it { is_expected.to validate_presence_of(:published_at) }
  end

  describe ".ordered" do
    let!(:message_1) { create(:litera_message, published_at: DateTime.current - 1.day) }
    let!(:message_2) { create(:litera_message, published_at: DateTime.current) }
    let!(:message_3) { create(:litera_message, published_at: DateTime.current + 1.day) }

    it "returns messages order by published_at desc" do
      messages = described_class.ordered
      expect(messages.first).to eql message_3
      expect(messages.second).to eql message_2
      expect(messages.third).to eql message_1
    end
  end
end
