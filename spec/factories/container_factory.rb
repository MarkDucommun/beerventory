FactoryGirl.define do
  factory :container do
    type 'Bottle'
    volume 750
    volume_unit 'ml'
    name 'Bomber'
  end
end
