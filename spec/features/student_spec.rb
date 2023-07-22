require "rails_helper"

describe "/students" do
  it "lists the first names of each Student", points: 1 do
    
    franny = Student.new
    franny.first_name = "Franny"
    franny.last_name = "Choi"
    franny.email = "franny@edu.edu"
    franny.save
    
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

    visit "/students"

    expect(page).to have_text("Franny")
    expect(page).to have_text("Pooja")
    expect(page).to have_text("Osi")

  end
end

describe "/students" do
  it "lists the last names of each Student", points: 1 do
    
    franny = Student.new
    franny.first_name = "Franny"
    franny.last_name = "Choi"
    franny.email = "franny@edu.edu"
    franny.save
    
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

    visit "/students"

    expect(page).to have_text("Choi")
    expect(page).to have_text("Bhan")
    expect(page).to have_text("Koro")

  end
end

describe "/students" do
  it "lists the email addresses of each Student", points: 1 do
    
    franny = Student.new
    franny.first_name = "Franny"
    franny.last_name = "Choi"
    franny.email = "franny@edu.edu"
    franny.save
    
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

    visit "/students"

    expect(page).to have_text("franny@edu.edu")
    expect(page).to have_text("pooja@edu.edu")
    expect(page).to have_text("osi@edu.edu")

  end
end

describe "/students" do
  it "has a link 'Show details' to the details page of each Student", points: 1 do
    
    franny = Student.new
    franny.first_name = "Franny"
    franny.last_name = "Choi"
    franny.email = "franny@edu.edu"
    franny.save
    
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

    visit "/students"

    expect(page).to have_tag("a", :with => { :href => "/students/#{franny.id}" }, :text => /Show details/i),
      "Expected page to have the a link with the text 'Show details' and an href of '/students/#{franny.id}'"
    
    expect(page).to have_tag("a", :with => { :href => "/students/#{pooja.id}" }, :text => /Show details/i),
      "Expected page to have the a link with the text 'Show details' and an href of '/students/#{pooja.id}'"

    expect(page).to have_tag("a", :with => { :href => "/students/#{osi.id}" }, :text => /Show details/i),
      "Expected page to have the a link with the text 'Show details' and an href of '/students/#{osi.id}'"

  end
end

describe "/students/[STUDENT ID]" do
  it "displays the number of courses the Student is enrolled in", points: 1 do
    
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
    
    american_writing = Course.new
    american_writing.title = "American Writing"
    american_writing.term_offered = "Spring"
    american_writing.department_id = english.id
    american_writing.save

    franny = Student.new
    franny.first_name = "Franny"
    franny.last_name = "Choi"
    franny.email = "franny@edu.edu"
    franny.save

    franny_in_poetry = Enrollment.new
    franny_in_poetry.course_id = poetry.id
    franny_in_poetry.student_id = franny.id
    franny_in_poetry.save

    franny_in_algorithms = Enrollment.new
    franny_in_algorithms.course_id = algorithms.id
    franny_in_algorithms.student_id = franny.id
    franny_in_algorithms.save

    franny_in_american_writing = Enrollment.new
    franny_in_american_writing.course_id = american_writing.id
    franny_in_american_writing.student_id = franny.id
    franny_in_american_writing.save

    visit "/students/#{franny.id}"

    expect(page).to have_text(/number of courses\s*3/i),
      "Expected to find text, 'Number of courses 3', but didn't find it."

  end
end

describe "/students/[STUDENT ID]" do
  it "displays the titles of the courses the Student is enrolled in", points: 1 do
    
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

    essay_writing = Course.new
    essay_writing.title = "Essay Writing"
    essay_writing.term_offered = "Winter"
    essay_writing.department_id = english.id
    essay_writing.save
    
    algorithms = Course.new
    algorithms.title = "Algorithms"
    algorithms.term_offered = "Spring"
    algorithms.department_id = technology.id
    algorithms.save
    
    american_writing = Course.new
    american_writing.title = "American Writing"
    american_writing.term_offered = "Spring"
    american_writing.department_id = english.id
    american_writing.save

    franny = Student.new
    franny.first_name = "Franny"
    franny.last_name = "Choi"
    franny.email = "franny@edu.edu"
    franny.save

    fatimah = Student.new
    fatimah.first_name = "Fatimah"
    fatimah.last_name = "Alattas"
    fatimah.email = "fatimah@edu.edu"
    fatimah.save

    franny_in_poetry = Enrollment.new
    franny_in_poetry.course_id = poetry.id
    franny_in_poetry.student_id = franny.id
    franny_in_poetry.save

    fatimah_in_essay_writing = Enrollment.new
    fatimah_in_essay_writing.course_id = essay_writing.id
    fatimah_in_essay_writing.student_id = fatimah.id
    fatimah_in_essay_writing.save

    franny_in_algorithms = Enrollment.new
    franny_in_algorithms.course_id = algorithms.id
    franny_in_algorithms.student_id = franny.id
    franny_in_algorithms.save

    franny_in_american_writing = Enrollment.new
    franny_in_american_writing.course_id = american_writing.id
    franny_in_american_writing.student_id = franny.id
    franny_in_american_writing.save

    visit "/students/#{franny.id}"

    expect(page).to_not have_text("Essay Writing")
    expect(page).to have_text("Poetry")
    expect(page).to have_text("Algorithms")
    expect(page).to have_text("American Writing")

  end
end


describe "/students/[STUDENT ID]" do
  it "the Course titles link to the details page of the Course", points: 1 do
    
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
    
    american_writing = Course.new
    american_writing.title = "American Writing"
    american_writing.term_offered = "Spring"
    american_writing.department_id = english.id
    american_writing.save

    franny = Student.new
    franny.first_name = "Franny"
    franny.last_name = "Choi"
    franny.email = "franny@edu.edu"
    franny.save

    franny_in_poetry = Enrollment.new
    franny_in_poetry.course_id = poetry.id
    franny_in_poetry.student_id = franny.id
    franny_in_poetry.save

    franny_in_algorithms = Enrollment.new
    franny_in_algorithms.course_id = algorithms.id
    franny_in_algorithms.student_id = franny.id
    franny_in_algorithms.save

    franny_in_american_writing = Enrollment.new
    franny_in_american_writing.course_id = american_writing.id
    franny_in_american_writing.student_id = franny.id
    franny_in_american_writing.save

    visit "/students/#{franny.id}"

    expect(page).to have_tag("a", :with => { :href => "/courses/#{poetry.id}" }, :text => /Poetry/i),
      "Expected page to have the a link with the text 'Poetry' and an href of '/courses/#{poetry.id}'"

    expect(page).to have_tag("a", :with => { :href => "/courses/#{algorithms.id}" }, :text => /Algorithms/i),
      "Expected page to have the a link with the text 'Algorithms' and an href of '/courses/#{algorithms.id}'"
    
    expect(page).to have_tag("a", :with => { :href => "/courses/#{american_writing.id}" }, :text => /American Writing/i),
      "Expected page to have the a link with the text 'American Writing' and an href of '/courses/#{american_writing.id}'"


  end
end
