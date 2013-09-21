namespace :cragbrag do
  desc "Load test and demo data"
  task :load_test_data => :environment do
  	user_infos = [['galia', 'traub', 'galiat@gmail.com', '5.2'],
  	['Brian', 'Oley', 'brian.oley@gmail.com', '5.3'],
  	['Kile', 'Salmon', 'kile.salmon@gmail.com', '5.2'],
  	['Kamil', 'Kantyka', 'kmkantyka@gmail.com', '5.12'],
  	['Tylor', 'Hess', 'tylor@mit.edu', '5.8'],
  	['Bob', 'Breznak', 'bob.breznak@gmail.com', '5.5'],
  	['Matt', 'Wilson', 'mattfwilson@gmail.com', '5.7'],
  	['David', 'Burnett', 'david@432ventures.com', '5.6']]
  	user_infos.each{|user_info| User.create(first_name: user_info[0],
                                            last_name: user_info[1],
                                            email: user_info[2],
                                            grade: user_info[3])}

    bkb_s = Gym.create(name: 'Brooklyn Boulders (Somerville)')
    Gym.create(name: 'Brooklyn Boulders (Brooklyn)')

    Problem.create(gym: bkb_s, active: true, name: "Grandma's House", grade: '5.1', height: 40)
    Problem.create(gym: bkb_s, active: true, name: 'Goldilocks', grade: '5.2', height: 90)
    Problem.create(gym: bkb_s, active: true, name: 'Sleeping Beauty', grade: '5.8', height: 50)
    Problem.create(gym: bkb_s, active: true, name: 'Snow White', grade: '5.12a', height: 130)
    Problem.create(gym: bkb_s, active: true, name: 'The Big Bad Wolf', grade: '5.15a', height: 160)


    Problem.all.each do |problem|
     User.where("grade <= ?", problem.grade).each do |user|
       #Climb.create(user: user, problem: problem, grade: problem.grade) 
     end
    end
    
  end
end