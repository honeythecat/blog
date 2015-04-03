FactoryGirl.define do
  factory :user do
    email('dog@world.com')
    password('12345678')
  end

  factory :post do
    title('Bark!')
    body('The cat is a bitch.')
  end

  factory :comment do
    commenter("DOG")
    comment("Serioulsy! The cat tried to kill me.")
  end

end
