namespace :refresh do
  desc "Create all new investors, and endorsements & associate it them properly"
  task :create_and_associate => :environment do
    require 'faker'

    Investor.destroy_all
    Endorsement.destroy_all

    30.times do |investor|
      Investor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, company: Faker::Company.name)
    end
    investor_id_array = Investor.pluck(:id)
    puts "#{Investor.count} investors generated. Investor_id_array: #{investor_id_array}"

    50.times do |endorsement|
      investor_variable = investor_id_array.sample
      endorsed_variable = investor_id_array.sample

      if investor_variable != endorsed_variable
        Endorsement.create!(investor_id: investor_variable, endorsed: endorsed_variable, comment: Faker::Hacker.say_something_smart)
      end
    end
    puts "#{Endorsement.count} endorsements generated."

  end
end
