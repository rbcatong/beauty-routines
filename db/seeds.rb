puts "Creating users..."
  User.create(id: 1, email: "rebeccaiscool@gmail.com", username: "rebeccat", password: "tongbecks")
  User.create(id: 2, email: "jhake1@gmail.com", username: "jackh", password: "huangj")

  puts "Creating routines..."
  Routine.create(id: 1, routine_content: "Wash face. Exfoliate", routine_days: "Sunday", routine_name: "Skincare",user_id: 1)
  Routine.create(id: 2, routine_content: "Sweep, mop,clean", routine_days: "Friday", routine_name: "Cleaning",user_id: 1)
  Routine.create(id: 3, routine_content: "cook vegetables, wash plates", routine_days: "Saturday", routine_name: "Cooking",user_id: 2)
