desc "產生測試用書籍資料"
namespace :data do
  task generate_5books: :environment do
    puts "Start generating test books"
    5.times do
      Book.create({
        name: Faker::Book.title,
        author: Faker::Book.author,
        price: Faker::Number.within(range: 100..1000),
      })
    end
  end
end
