desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  
  students = [
    {:id=>314, :first_name=>"Nikia", :last_name=>"Fritsch", :email=>"nikiafritsch@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>315, :first_name=>"Brent", :last_name=>"Gleason", :email=>"brentgleason@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>316, :first_name=>"Bennett", :last_name=>"Runte", :email=>"bennettrunte@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>317, :first_name=>"Augustus", :last_name=>"Braun", :email=>"augustusbraun@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>318, :first_name=>"Antony", :last_name=>"Zboncak", :email=>"antonyzboncak@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>319, :first_name=>"Merilyn", :last_name=>"Spencer", :email=>"merilynspencer@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>320, :first_name=>"Courtney", :last_name=>"Bashirian", :email=>"courtneybashirian@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>321, :first_name=>"Lang", :last_name=>"Blick", :email=>"langblick@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>322, :first_name=>"Windy", :last_name=>"Turner", :email=>"windyturner@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>323, :first_name=>"Maren", :last_name=>"Heaney", :email=>"marenheaney@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>324, :first_name=>"Jenine", :last_name=>"Mante", :email=>"jeninemante@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>325, :first_name=>"Von", :last_name=>"Kassulke", :email=>"vonkassulke@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>326, :first_name=>"Andy", :last_name=>"Crona", :email=>"andycrona@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>327, :first_name=>"Darnell", :last_name=>"Kihn", :email=>"darnellkihn@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>328, :first_name=>"Lisette", :last_name=>"Beier", :email=>"lisettebeier@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>329, :first_name=>"Francie", :last_name=>"West", :email=>"franciewest@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>330, :first_name=>"Stephany", :last_name=>"Cruickshank", :email=>"stephanycruickshank@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>331, :first_name=>"Octavio", :last_name=>"Howe", :email=>"octaviohowe@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>332, :first_name=>"Reita", :last_name=>"Konopelski", :email=>"reitakonopelski@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}, 
    {:id=>333, :first_name=>"Odis", :last_name=>"Gutmann", :email=>"odisgutmann@school.edu", :created_at=>"2020-07-31T10:29:43-05:00", :updated_at=>"2020-07-31T10:29:43-05:00"}
  ]
  Student.delete_all
  Student.insert_all!(students)

  departments = [
    {id: 64, name: "Technology", created_at: "2015-08-12 17:20:05", updated_at: "2015-08-12 17:20:09"},
    {id: 65, name: "English", created_at: "2015-08-12 17:20:05", updated_at: "2015-08-12 17:20:09"},
    {id: 66, name: "Business", created_at: "2015-08-12 17:20:05", updated_at: "2015-08-12 17:20:09"}
  ]

  Department.delete_all
  Department.insert_all!(departments)

  courses = [
    {:id=>118, :title=>"Application Development", :term_offered=>"Spring", :department_id=>64, :created_at=>"2020-07-31", :updated_at=>"2020-07-31"}, 
    {:id=>119, :title=>"Composition", :term_offered=>"Spring", :department_id=>65, :created_at=>"2020-07-31", :updated_at=>"2020-07-31"}, 
    {:id=>120, :title=>"Economics", :term_offered=>"Summer", :department_id=>66, :created_at=>"2020-07-31", :updated_at=>"2020-07-31"}, 
    {:id=>121, :title=>"Product Management", :term_offered=>"Fall", :department_id=>66, :created_at=>"2020-07-31", :updated_at=>"2020-07-31"}, 
    {:id=>122, :title=>"Finance", :term_offered=>"Winter", :department_id=>66, :created_at=>"2020-07-31", :updated_at=>"2020-07-31"}, 
    {:id=>123, :title=>"Logic Building", :term_offered=>"Winter", :department_id=>64, :created_at=>"2020-07-31", :updated_at=>"2020-07-31"},
    {:id=>124, :title=>"American Fiction", :term_offered=>"Summer", :department_id=>65, :created_at=>"2020-07-31", :updated_at=>"2020-07-31"}, 
    {:id=>125, :title=>"Individualizing Writing Instruction", :term_offered=>"Fall", :department_id=>65, :created_at=>"2020-07-31", :updated_at=>"2020-07-31"}
  ]

  Course.delete_all
  Course.insert_all!(courses)

  enrollments = [ 
    {:id=>414, :student_id=>314, :course_id=>122, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>415, :student_id=>314, :course_id=>119, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>416, :student_id=>315, :course_id=>123, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>417, :student_id=>315, :course_id=>121, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>418, :student_id=>316, :course_id=>119, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>419, :student_id=>316, :course_id=>125, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>420, :student_id=>316, :course_id=>118, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>421, :student_id=>317, :course_id=>120, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>422, :student_id=>317, :course_id=>121, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>423, :student_id=>318, :course_id=>120, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>424, :student_id=>319, :course_id=>118, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>425, :student_id=>320, :course_id=>123, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>426, :student_id=>320, :course_id=>118, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>427, :student_id=>321, :course_id=>121, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>428, :student_id=>321, :course_id=>125, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>429, :student_id=>321, :course_id=>123, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>430, :student_id=>322, :course_id=>123, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>431, :student_id=>322, :course_id=>120, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>432, :student_id=>322, :course_id=>125, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>433, :student_id=>323, :course_id=>123, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>434, :student_id=>323, :course_id=>124, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>435, :student_id=>324, :course_id=>122, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>436, :student_id=>324, :course_id=>124, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>437, :student_id=>324, :course_id=>125, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>438, :student_id=>324, :course_id=>120, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>439, :student_id=>325, :course_id=>124, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>440, :student_id=>325, :course_id=>121, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>441, :student_id=>326, :course_id=>123, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>442, :student_id=>326, :course_id=>120, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>443, :student_id=>327, :course_id=>118, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>444, :student_id=>327, :course_id=>125, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>445, :student_id=>327, :course_id=>121, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>446, :student_id=>328, :course_id=>125, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>447, :student_id=>329, :course_id=>125, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>448, :student_id=>329, :course_id=>119, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>449, :student_id=>329, :course_id=>120, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>450, :student_id=>329, :course_id=>123, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>451, :student_id=>330, :course_id=>122, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>452, :student_id=>330, :course_id=>121, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>453, :student_id=>331, :course_id=>119, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>454, :student_id=>331, :course_id=>125, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>455, :student_id=>331, :course_id=>124, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>456, :student_id=>331, :course_id=>122, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>457, :student_id=>332, :course_id=>119, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>458, :student_id=>332, :course_id=>125, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>459, :student_id=>332, :course_id=>122, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>460, :student_id=>332, :course_id=>118, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>461, :student_id=>333, :course_id=>118, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>462, :student_id=>333, :course_id=>124, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}, 
    {:id=>463, :student_id=>333, :course_id=>123, :created_at=>"2020-07-13", :updated_at=>"2020-07-15"}
  ]
  Enrollment.delete_all
  Enrollment.insert_all!(enrollments)

  puts "Sample data generated!"
end
