require "rails_helper"

describe "/courses" do
  it "lists the titles of each Course", points: 1 do
    
    english = Department.new
    english.name = "English"
    english.save

    technology = Department.new
    technology.name = "Technology"
    technology.save
    
    poetry = Course.new
    poetry.title = "Poetry"
    poetry.term_offered = "Fall"
    poetry.department_id = english.id
    poetry.save

    advanced_theory = Course.new
    advanced_theory.title = "Advanced Theory"
    advanced_theory.term_offered = "Fall"
    advanced_theory.department_id = english.id
    advanced_theory.save

    algorithms = Course.new
    algorithms.title = "Algorithms"
    algorithms.term_offered = "Spring"
    algorithms.department_id = technology.id
    algorithms.save

    visit "/courses"

    expect(page).to have_text("Poetry")
    expect(page).to have_text("Advanced Theory")
    expect(page).to have_text("Algorithms")

  end
end

describe "/courses" do
  it "lists the term offered for each Course", points: 1 do
    
    english = Department.new
    english.name = "English"
    english.save

    technology = Department.new
    technology.name = "Technology"
    technology.save
    
    poetry = Course.new
    poetry.title = "Poetry"
    poetry.term_offered = "Winter"
    poetry.department_id = english.id
    poetry.save

    advanced_theory = Course.new
    advanced_theory.title = "Advanced Theory"
    advanced_theory.term_offered = "Fall"
    advanced_theory.department_id = english.id
    advanced_theory.save

    algorithms = Course.new
    algorithms.title = "Algorithms"
    algorithms.term_offered = "Spring"
    algorithms.department_id = technology.id
    algorithms.save

    visit "/courses"

    expect(page).to have_text("Winter")
    expect(page).to have_text("Fall")
    expect(page).to have_text("Spring")

  end
end

describe "/courses" do
  it "lists the name of the Department for each Course", points: 1 do
    
    english = Department.new
    english.name = "English"
    english.save

    technology = Department.new
    technology.name = "Technology"
    technology.save
    
    poetry = Course.new
    poetry.title = "Poetry"
    poetry.term_offered = "Winter"
    poetry.department_id = english.id
    poetry.save

    advanced_theory = Course.new
    advanced_theory.title = "Advanced Theory"
    advanced_theory.term_offered = "Fall"
    advanced_theory.department_id = english.id
    advanced_theory.save

    algorithms = Course.new
    algorithms.title = "Algorithms"
    algorithms.term_offered = "Spring"
    algorithms.department_id = technology.id
    algorithms.save

    visit "/courses"

    expect(page).to have_text("English")
    expect(page).to have_text("Technology")

  end
end

describe "/courses" do
  it "has a link with the text 'Show details' to the details page of each Course", points: 1 do
    
    english = Department.new
    english.name = "English"
    english.save

    technology = Department.new
    technology.name = "Technology"
    technology.save
    
    poetry = Course.new
    poetry.title = "Poetry"
    poetry.term_offered = "Winter"
    poetry.department_id = english.id
    poetry.save

    advanced_theory = Course.new
    advanced_theory.title = "Advanced Theory"
    advanced_theory.term_offered = "Fall"
    advanced_theory.department_id = english.id
    advanced_theory.save

    algorithms = Course.new
    algorithms.title = "Algorithms"
    algorithms.term_offered = "Spring"
    algorithms.department_id = technology.id
    algorithms.save

    visit "/courses"

    expect(page).to have_tag("a", :with => { :href => "/courses/#{poetry.id}" }, :text => /Show details/i),
      "Expected page to have the a link with the text 'Show details' and an href of '/courses/#{poetry.id}'"

    expect(page).to have_tag("a", :with => { :href => "/courses/#{advanced_theory.id}" }, :text => /Show details/i),
      "Expected page to have the a link with the text 'Show details' and an href of '/courses/#{advanced_theory.id}'"
    
    expect(page).to have_tag("a", :with => { :href => "/courses/#{algorithms.id}" }, :text => /Show details/i),
      "Expected page to have the a link with the text 'Show details' and an href of '/courses/#{algorithms.id}'"
  end
end

describe "/courses" do
  it "has a link to the details page of each Course's Department", points: 1 do
    
    english = Department.new
    english.name = "English"
    english.save

    technology = Department.new
    technology.name = "Technology"
    technology.save
    
    poetry = Course.new
    poetry.title = "Poetry"
    poetry.term_offered = "Winter"
    poetry.department_id = english.id
    poetry.save

    advanced_theory = Course.new
    advanced_theory.title = "Advanced Theory"
    advanced_theory.term_offered = "Fall"
    advanced_theory.department_id = english.id
    advanced_theory.save

    algorithms = Course.new
    algorithms.title = "Algorithms"
    algorithms.term_offered = "Spring"
    algorithms.department_id = technology.id
    algorithms.save

    visit "/courses"

    expect(page).to have_tag("a", :with => { :href => "/departments/#{english.id}" }, :text => /English/i, :minimum => 2),
      "Expected page to have the a link with the text 'English' and an href of '/departments/#{english.id}'"
    
    expect(page).to have_tag("a", :with => { :href => "/departments/#{technology.id}" }, :text => /Technology/i),
      "Expected page to have the a link with the text 'Technology' and an href of '/departments/#{technology.id}'"
  end
end

describe "/courses/[COURSE ID]" do
  it "displays the name of the Course's Department", points: 1 do
    
    technology = Department.new
    technology.name = "Technology"
    technology.save

    algorithms = Course.new
    algorithms.title = "Algorithms"
    algorithms.term_offered = "Spring"
    algorithms.department_id = technology.id
    algorithms.save

    visit "/courses/#{algorithms.id}"

    expect(page).to have_text("Technology")
    
  end
end

describe "/courses/[COURSE ID]" do
  it "has a link to the details page of the Course's Department", points: 1 do
    
    english = Department.new
    english.name = "English"
    english.save

    technology = Department.new
    technology.name = "Technology"
    technology.save
    
    poetry = Course.new
    poetry.title = "Poetry"
    poetry.term_offered = "Winter"
    poetry.department_id = english.id
    poetry.save

    algorithms = Course.new
    algorithms.title = "Algorithms"
    algorithms.term_offered = "Spring"
    algorithms.department_id = technology.id
    algorithms.save

    visit "/courses/#{algorithms.id}"

    expect(page).to_not have_tag("a", :with => { :href => "/departments/#{english.id}" }, :text => /English/i),
      "Expected page to NOT have the a link with the text 'English' and an href of '/departments/#{english.id}'"
    
    expect(page).to have_tag("a", :with => { :href => "/departments/#{technology.id}" }, :text => /Technology/i),
      "Expected page to have the a link with the text 'Technology' and an href of '/departments/#{technology.id}'"
  end
end

describe "/courses/[COURSE ID]" do
  it "displays the number of enrollments there are for the Course", points: 1 do
    
    english = Department.new
    english.name = "English"
    english.save

    technology = Department.new
    technology.name = "Technology"
    technology.save
    
    poetry = Course.new
    poetry.title = "Poetry"
    poetry.term_offered = "Winter"
    poetry.department_id = english.id
    poetry.save

    algorithms = Course.new
    algorithms.title = "Algorithms"
    algorithms.term_offered = "Spring"
    algorithms.department_id = technology.id
    algorithms.save

    james = Student.new
    james.first_name = "James"
    james.last_name = "Semaj"
    james.email = "james@edu.edu"
    james.save
    
    pooja = Student.new
    pooja.first_name = "Pooja"
    pooja.last_name = "Bhan"
    pooja.email = "pooja@edu.edu"
    pooja.save
    
    osi = Student.new
    osi.first_name = "Osi"
    osi.last_name = "Koro"
    osi.email = "osi@edu.edu"
    osi.save

    james_in_poetry = Enrollment.new
    james_in_poetry.course_id = poetry.id
    james_in_poetry.student_id = james.id
    james_in_poetry.save

    pooja_in_poetry = Enrollment.new
    pooja_in_poetry.course_id = poetry.id
    pooja_in_poetry.student_id = pooja.id
    pooja_in_poetry.save

    osi_in_poetry = Enrollment.new
    osi_in_poetry.course_id = poetry.id
    osi_in_poetry.student_id = osi.id
    osi_in_poetry.save

    osi_in_algorithms = Enrollment.new
    osi_in_algorithms.course_id = algorithms.id
    osi_in_algorithms.student_id = osi.id
    osi_in_algorithms.save

    visit "/courses/#{poetry.id}"


    expect(page).to have_text(/number of enrolled students\s*3/i),
      "Expected to find text, 'Number of enrolled students 3', but didn't find it."

  end
end

describe "/courses/[COURSE ID]" do
  it "displays the names of the Students enrolled in the Course", points: 1 do
    
    english = Department.new
    english.name = "English"
    english.save
    
    poetry = Course.new
    poetry.title = "Poetry"
    poetry.term_offered = "Winter"
    poetry.department_id = english.id
    poetry.save

    james = Student.new
    james.first_name = "James"
    james.last_name = "Semaj"
    james.email = "james@edu.edu"
    james.save
    
    pooja = Student.new
    pooja.first_name = "Pooja"
    pooja.last_name = "Bhan"
    pooja.email = "pooja@edu.edu"
    pooja.save
    
    osi = Student.new
    osi.first_name = "Osi"
    osi.last_name = "Koro"
    osi.email = "osi@edu.edu"
    osi.save

    james_in_poetry = Enrollment.new
    james_in_poetry.course_id = poetry.id
    james_in_poetry.student_id = james.id
    james_in_poetry.save

    pooja_in_poetry = Enrollment.new
    pooja_in_poetry.course_id = poetry.id
    pooja_in_poetry.student_id = pooja.id
    pooja_in_poetry.save

    osi_in_poetry = Enrollment.new
    osi_in_poetry.course_id = poetry.id
    osi_in_poetry.student_id = osi.id
    osi_in_poetry.save

    visit "/courses/#{poetry.id}"


      expect(page).to have_text("James Semaj")
      expect(page).to have_text("Pooja Bhan")
      expect(page).to have_text("Osi Koro")

  end
end

describe "/courses/[COURSE ID]" do
  it "has the names of the enrolled Students link the student details page", points: 1 do
    
    english = Department.new
    english.name = "English"
    english.save
    
    poetry = Course.new
    poetry.title = "Poetry"
    poetry.term_offered = "Winter"
    poetry.department_id = english.id
    poetry.save

    james = Student.new
    james.first_name = "James"
    james.last_name = "Semaj"
    james.email = "james@edu.edu"
    james.save
    
    pooja = Student.new
    pooja.first_name = "Pooja"
    pooja.last_name = "Bhan"
    pooja.email = "pooja@edu.edu"
    pooja.save
    
    osi = Student.new
    osi.first_name = "Osi"
    osi.last_name = "Koro"
    osi.email = "osi@edu.edu"
    osi.save

    james_in_poetry = Enrollment.new
    james_in_poetry.course_id = poetry.id
    james_in_poetry.student_id = james.id
    james_in_poetry.save

    pooja_in_poetry = Enrollment.new
    pooja_in_poetry.course_id = poetry.id
    pooja_in_poetry.student_id = pooja.id
    pooja_in_poetry.save

    osi_in_poetry = Enrollment.new
    osi_in_poetry.course_id = poetry.id
    osi_in_poetry.student_id = osi.id
    osi_in_poetry.save

    visit "/courses/#{poetry.id}"


    expect(page).to have_tag("a", :with => { :href => "/students/#{james.id}" }, :text => /James Semaj/i),
      "Expected page to have the a link with the text 'James Semaj' and an href of '/students/#{james.id}'"
    
    expect(page).to have_tag("a", :with => { :href => "/students/#{pooja.id}" }, :text => /Pooja Bhan/i),
      "Expected page to have the a link with the text 'Pooja Bhan' and an href of '/students/#{pooja.id}'"

    expect(page).to have_tag("a", :with => { :href => "/students/#{osi.id}" }, :text => /Osi Koro/i),
      "Expected page to have the a link with the text 'Osi Koro' and an href of '/students/#{osi.id}'"

  end
end
