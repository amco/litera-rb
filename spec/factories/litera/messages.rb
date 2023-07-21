# frozen_string_literal: true

FactoryBot.define do
  factory :litera_message, class: "Litera::Message" do
    sequence(:external_id) { |n| n }

    service { :amazon_sqs }
    published_at { DateTime.current }

    body do
      {
        first_name: "Darth",
        last_name: "Vader"
      }
    end

    metadata do
      {
        action: "create",
        resource: "users"
      }
    end
  end
end
