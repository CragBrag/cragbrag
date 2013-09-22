namespace :cragbrag do
  desc "Load test and demo data"
  task :load_test_data => :environment do
    demoer_facebook_id = 29102586

  	user_infos = [['Galia', 'Traub', 'galiat@gmail.com', '5.9', '29102655'],
  	['Brian', 'Oley', 'brian.oley@gmail.com', '5.8', '1824004'],
  	['Kile', 'Salmon', 'kile.salmon@gmail.com', '5.6', '42402863'],
  	['Kamil', 'Kantyka', 'kmkantyka@gmail.com', '5.12', '100000518190045'],
  	['Tylor', 'Hess', 'tylor@mit.edu', '5.8', '712648'],
  	['Bob', 'Breznak', 'bob.breznak@gmail.com', '5.11', '29102586'],
  	['Matt', 'Wilson', 'mattfwilson@gmail.com', '5.7', '747958893'],
  	['David', 'Burnett', 'david@432ventures.com', '5.6' ,'100003343478213'],
    ['Justin', 'Mendelson', 'david@432ventures.com', '5.6' ,'9507933'],
    ['Josh', 'Jordan', 'josh.jordan@gmail.com', '4.2', '848468136066'],
    ['Christian', 'Roy', 'croy@gmail.com', '5.9', '654499590702'],
    ['Samantha', 'Siegel', 'sam@sam.sam', '4.9', '10100750248897252'],
    ['Shira', 'Rockowitz', 'shira@shira.com', '5.0', '660323679182'],
    ['Carol', 'Wood', 'cw@gmail.com', '4.9', '3574721326888']]

  	user_infos.each{|user_info| User.create(first_name: user_info[0],
                                            last_name: user_info[1],
                                            email: user_info[2],
                                            grade: user_info[3],
                                            facebook_id: user_info[4])}

    bkb_s = Gym.create(name: 'Brooklyn Boulders (Somerville)')
    bkb_b = Gym.create(name: 'Brooklyn Boulders (Brooklyn)')

    top_rope = 'top_rope'
    boulder = 'bouldering'

    Problem.create(gym: bkb_s, grade_type: top_rope, active: true, name: 'The Big Bad Wolf', grade: '5.12', height: 160)
    Problem.create(gym: bkb_s, grade_type: boulder, active: true, name: "Sleepy", grade: '1')
    Problem.create(gym: bkb_s, grade_type: boulder, active: true, name: 'Dopey', grade: '3')
    Problem.create(gym: bkb_s, grade_type: boulder, active: true, name: 'Tiny', grade: '1')
    Problem.create(gym: bkb_s, grade_type: boulder, active: true, name: 'The Small Bad Wolf', grade: '5')

    Problem.all.each do |problem|
     User.where("grade >= ?", problem.grade).each_with_index do |user, index|
       user.climbs.create problem: problem, grade: problem.grade, attempted_on: index.days.ago
     end
    end

    Problem.create(gym: bkb_s, grade_type: top_rope, active: true, name: "Grandma's House", grade: '5.6', height: 40)
    Problem.create(gym: bkb_s, grade_type: top_rope, active: true, name: 'Goldilocks', grade: '5.7', height: 90)
    Problem.create(gym: bkb_s, grade_type: top_rope, active: true, name: 'Sleeping Beauty', grade: '5.9', height: 50)
    Problem.create(gym: bkb_s, grade_type: top_rope, active: true, name: 'Snow White', grade: '5.8', height: 130)

    Problem.all.each do |problem|
     User.where("grade >= ?", problem.grade).each_with_index do |user, index|
       user.climbs.create problem: problem, grade: problem.grade, attempted_on: index.days.ago
     end
    end

    Problem.create(gym: bkb_b, grade_type: top_rope, active: true, name: 'Murcury', grade: '5.12', height: 160)
    Problem.create(gym: bkb_b, grade_type: boulder, active: true, name: 'Venus', grade: '1')
    Problem.create(gym: bkb_b, grade_type: boulder, active: true, name: 'Earth', grade: '3')
    Problem.create(gym: bkb_b, grade_type: boulder, active: true, name: 'Mars', grade: '1')
    Problem.create(gym: bkb_b, grade_type: boulder, active: true, name: 'Jupiter', grade: '5')
  end
end
