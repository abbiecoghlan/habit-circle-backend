# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Habit.destroy_all
Day.destroy_all
Progress.destroy_all


#CREATE USERS
user1 = User.create(username:"thatsabbie", name:"abbie", password: "123456")

#CREATE HABITS
habit1  = Habit.create(name: "floss", user_id: user1.id)
habit2  = Habit.create(name: "vitamins", user_id: user1.id)
habit3  = Habit.create(name: "10,000 steps", user_id: user1.id)
habit4  = Habit.create(name: "drink water", user_id: user1.id)
habit5  = Habit.create(name: "stretch", user_id: user1.id)
habit6  = Habit.create(name: "meditate", user_id: user1.id)
habit7  = Habit.create(name: "journal", user_id: user1.id)


#CREATE DAYS FOR EACH DATE YTD
(1..Time.now.month).each { |month| 

    (1..Time.days_in_month(month, Time.now.year)).each { |day| 
        Day.create(month: month, day: day, year: Time.now.year)
        }
}


#CREATE PROGRESS FOR EACH HABIT
Day.all.select { |day| day.month == Time.now.month && day.year == Time.now.year}.each { |day| 
    Habit.all.each { |habit| 
        Progress.create(habit_id: habit.id, day_id: day.id, completed: false)
    }
}


