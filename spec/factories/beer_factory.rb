FactoryGirl.define do
  factory :beer do
    name 'Test Beer'
    bottling_date { Random.rand < 0.3 ? Time.now : nil }
    purchase_date { Time.now }
    best_by_date { Random.rand < 0.5 ? Time.now : nil }
  end
end
