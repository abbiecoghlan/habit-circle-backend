# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Habit.destroy_all
Month.destroy_all
Day.destroy_all
Progress.destroy_all


user1 = User.create(username:"thatsabbie", name:"abbie", password: "123456")

# (1..Time.now.month).each { |i| 

# Month.create(year: Time.now.year, month_num: i)
# (1..Time.days_in_month(i, Time.now.year)).each {|j| 
#     Day.create()
#     }
# }



# (1..Time.days_in_month(i, Time.now.year)).each {|j| 
#     Day.create()
#     }

# Time.days_in_month(3, 2021)





#Create months for current year to date
(1..Time.now.month).each { |i| Month.create(year: Time.now.year, month_num: i)}

#Create days for each month
Month.all.each { |month| 

(1..Time.days_in_month(month.month_num, Time.now.year)).each { |day| 
    Day.create(month_id: month.id, day_num: day)
    }
}





#BEFORE I HAD DYNAMICALLY CREATED THE MONTHS
# january = Month.create(year: 2021, month_num: 1)
# february = Month.create(year: 2021, month_num: 2)
# march = Month.create(year: 2021, month_num: 3)
# april = Month.create(year: 2021, month_num: 4) 
# may = Month.create(year: 2021, month_num: 5)
# june = Month.create(year: 2021, month_num: 6)
# july = Month.create(year: 2021, month_num: 7)


#BEFORE I HAD DYNAMICALLY GENERATED THE DAYS
# march1 = Day.create(month_id: march.id, day_num: 1)
# march2 = Day.create(month_id: march.id, day_num: 2)
# march3 = Day.create(month_id: march.id, day_num: 3)
# march4 = Day.create(month_id: march.id, day_num: 4)
# march5 = Day.create(month_id: march.id, day_num: 5)
# march6 = Day.create(month_id: march.id, day_num: 6)
# march7 = Day.create(month_id: march.id, day_num: 7)
# march8 = Day.create(month_id: march.id, day_num: 8)
# march9 = Day.create(month_id: march.id, day_num: 9)
# march10 = Day.create(month_id: march.id, day_num: 10)
# march11 = Day.create(month_id: march.id, day_num: 11)
# march12 = Day.create(month_id: march.id, day_num: 12)
# march13 = Day.create(month_id: march.id, day_num: 13)
# march14 = Day.create(month_id: march.id, day_num: 14)
# march15 = Day.create(month_id: march.id, day_num: 15)
# march16 = Day.create(month_id: march.id, day_num: 16)
# march17 = Day.create(month_id: march.id, day_num: 17)
# march18 = Day.create(month_id: march.id, day_num: 18)
# march19 = Day.create(month_id: march.id, day_num: 19)
# march20 = Day.create(month_id: march.id, day_num: 20)
# march21 = Day.create(month_id: march.id, day_num: 21)
# march22 = Day.create(month_id: march.id, day_num: 22)
# march23 = Day.create(month_id: march.id, day_num: 23)
# march24 = Day.create(month_id: march.id, day_num: 24)
# march25 = Day.create(month_id: march.id, day_num: 25)
# march26 = Day.create(month_id: march.id, day_num: 26)
# march27 = Day.create(month_id: march.id, day_num: 27)
# march28 = Day.create(month_id: march.id, day_num: 28)
# march29 = Day.create(month_id: march.id, day_num: 29)
# march30 = Day.create(month_id: march.id, day_num: 30)
# march31 = Day.create(month_id: march.id, day_num: 31)


habit1  = Habit.create(name: "floss", user_id: user1.id)
habit2  = Habit.create(name: "vitamins", user_id: user1.id)
habit3  = Habit.create(name: "10,000 steps", user_id: user1.id)
habit4  = Habit.create(name: "drink water", user_id: user1.id)
habit5  = Habit.create(name: "stretch", user_id: user1.id)
habit6  = Habit.create(name: "meditate", user_id: user1.id)
habit7  = Habit.create(name: "journal", user_id: user1.id)

# habitArray = [habit1, habit2, habit3, habit4, habit5, habit6, habit7]

# marchDaysArray = [march1, march2, march3, march4, march5, march6, march7, march8, march9, march10, march11, march12, march13, march14, march15, march16, march17, march18, march19, march20, march21, march22, march23, march24, march25, march26, march27, march28, march29, march30, march31 ]



# testone = [1, 2, 3, 4, 5, 6 ]
# testtwo = ["habitone", "hab2", "hab3", "hab4"]

# testone.map do |day| 
#     testtwo.map do |habit|
#         puts "#{habit} #{day}"
#     end 
# end 






Month.find_by(month_num: Time.now.month).days.each { |day| 
    Habit.all.each { |habit| 
    Progress.create(habit_id: habit.id, day_id: day.id, completed: false)
    }

}


# marchDaysArray.map do |day| 
#     habitArray.map do |habit|
#         Progress.create(habit_id: habit.id, day_id: day.id, completed: false)
#     end 
# end 
