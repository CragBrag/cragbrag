namespace :cragbrag do
  desc "Load test and demo data"
  task :load_test_data => :environment do
    demoer_facebook_id = 29102586

  	user_infos = [
    ['Galia', 'Traub', 'galiat@gmail.com', '9', '29102655'],
  	['Brian', 'Oley', 'brian.oley@gmail.com', '8', '1824004'],
  	['Kile', 'Salmon', 'kile.salmon@gmail.com', '6', '42402863'],
  	['Kamil', 'Kantyka', 'kmkantyka@gmail.com', '12', '100000518190045'],
  	['Tylor', 'Hess', 'tylor@mit.edu', '8', '712648'],
  	['Bob', 'Breznak', 'bob.breznak@gmail.com', '11', '29102586'],
  	['Matt', 'Wilson', 'mattfwilson@gmail.com', '7', '747958893'],
  	['David', 'Burnett', 'david@432ventures.com', '6' ,'100003343478213'],
    ['Justin', 'Mendelson', 'david@432ventures.com', '5.6' ,'9507933'],
    ['Josh', 'Jordan', 'josh.jordan@gmail.com', '2', '17506995'],
    ['Samantha', 'Siegel', 'sam@sam.sam', '6', '26111193'],
    ['Shira', 'Rockowitz', 'shira@shira.com', '6', '29102698'],
    ['Vicky', 'Valencia', 'cw@gmail.com', '6', '29104959']]

  	user_infos.each{|user_info| User.create(first_name: user_info[0],
                                            last_name: user_info[1],
                                            email: user_info[2],
                                            grade: user_info[3].to_f,
                                            facebook_id: user_info[4])}

    bkb_s = Gym.create(name: 'Brooklyn Boulders (Somerville)')
    bkb_b = Gym.create(name: 'Brooklyn Boulders (Brooklyn)')

    top_rope = 'top_rope'
    boulder = 'bouldering'

    Problem.create(gym: bkb_s, grade_type: top_rope, active: true, name: 'The Big Bad Wolf', grade: 5.12, height: 160)
    Problem.create(gym: bkb_s, grade_type: top_rope, active: true, name: 'The Small Bad Wolf', grade: 5.11)
    Problem.create(gym: bkb_s, grade_type: top_rope, active: true, name: "Grandma's House", grade: 5.6, height: 40)
    Problem.create(gym: bkb_s, grade_type: top_rope, active: true, name: 'Goldilocks', grade: 5.7, height: 90)
    Problem.create(gym: bkb_s, grade_type: top_rope, active: true, name: 'Sleeping Beauty', grade: 5.9, height: 50)
    Problem.create(gym: bkb_s, grade_type: top_rope, active: true, name: 'Snow White', grade: 5.8, height: 130)

    Problem.create(gym: bkb_b, grade_type: boulder, active: true, name: 'Murcury', grade: 1, height: 16)
    Problem.create(gym: bkb_b, grade_type: boulder, active: true, name: 'Venus', grade: 2)
    Problem.create(gym: bkb_b, grade_type: boulder, active: true, name: 'Mars', grade: 4)
    Problem.create(gym: bkb_b, grade_type: boulder, active: true, name: 'Jupiter', grade: 5)


    #Each user does 3 bouldering climbs
    User.all.each_with_index do |user, index|
      Problem.bouldering.sample.climbs.create user: user, attempted_on: index.days.ago
    end
    User.all.each_with_index do |user, index|
      Problem.bouldering.sample.climbs.create user: user, attempted_on: index.days.ago
    end
    User.all.each_with_index do |user, index|
      Problem.bouldering.sample.climbs.create user: user, attempted_on: index.days.ago
    end


    Problem.top_rope.each do |problem|
      User.where("users.grade >= ?", problem.normalized_grade).each_with_index do |user, index|
        user.climbs.create problem: problem, grade: problem.grade, attempted_on: index.days.ago
      end
    end

  end
end
