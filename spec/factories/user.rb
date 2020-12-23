FactoryBot.define do
  factory :user do
    nick_name { 'sampleman' }
    email { 'sample@sample.com' }
    password { '123456' }
    password_confirmation { '123456' }
    family_name           { '山田' }
    family_name_kana      { 'ヤマダ' }
    first_name            { '太郎' }
    first_name_kana       { 'タロウ' }
    birthday { '2000-01-01' }
  end
end
