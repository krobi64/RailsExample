FactoryBot.define do
  sequence :question_id_sequence
  factory :question do
    question_id { generate :question_id_sequence }
    tags { "MyString" }
    is_answered { [false, true].sample }
    score { rand(100) }
    title { "MyTitle #{question_id}" }
    link { "MyLink #{question_id}" }
  end
end
