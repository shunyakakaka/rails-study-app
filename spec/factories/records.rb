FactoryBot.define do
  factory :record do
    user { nil }
    time { 1 }
    total_time { 1 }
    task_kind { "MyString" }
  end
end
