# frozen_string_literal: true

require "rails_helper"

RSpec.describe Litera::Message do
  describe "Database columns" do
    it { is_expected.to have_db_column(:body).of_type(:jsonb).with_options(default: {}) }
    it { is_expected.to have_db_column(:metadata).of_type(:jsonb).with_options(default: {}) }
    it { is_expected.to have_db_column(:service).of_type(:string) }
    it { is_expected.to have_db_column(:external_id).of_type(:string) }
    it { is_expected.to have_db_column(:published_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "Database indexes" do
    it { is_expected.to have_db_index(:published_at) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:service) }
    it { is_expected.to validate_presence_of(:metadata) }
    it { is_expected.to validate_presence_of(:external_id) }
    it { is_expected.to validate_presence_of(:published_at) }
  end

  describe ".ordered" do
    let!(:older_message) { create(:litera_message, published_at: DateTime.current - 2.day) }
    let!(:old_message) { create(:litera_message, published_at: DateTime.current - 1.day) }
    let!(:new_message) { create(:litera_message, published_at: DateTime.current) }

    it "returns messages ordered by published_at desc" do
      messages = described_class.ordered
      expect(messages.to_a).to eql [new_message, old_message, older_message]
    end
  end
end
