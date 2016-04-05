require 'csv'

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end


csv_text = File.read(Rails.root.join('lib', 'seeds', 'companylist_nasdaq.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = Ticker.new
  t.ticker = row['ticker']
  t.company_name = row['company_name']
  t.save
  puts "#{t.ticker}, #{t.company_name} saved"
end

puts "There are now #{Ticker.count} rows in the transactions table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'companylist_amex.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = Ticker.new
  t.ticker = row['ticker']
  t.company_name = row['company_name']
  t.save
  puts "#{t.ticker}, #{t.company_name} saved"
end

puts "There are now #{Ticker.count} rows in the transactions table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'companylist_nyse.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  t = Ticker.new
  t.ticker = row['ticker']
  t.company_name = row['company_name']
  t.save
  puts "#{t.ticker}, #{t.company_name} saved"
end

puts "There are now #{Ticker.count} rows in the transactions table"
