require "rails_helper"

describe "/courses" do
  it "has a form", :points => 1 do
    visit "/courses"

    expect(page).to have_css("form", minimum: 1)
  end
end

describe "/courses" do
  it "has a label for 'Title' with text: 'Title'", :points => 1, hint: h("copy_must_match label_for_input") do
    visit "/courses"

    expect(page).to have_css("label", text: "Title")
  end
end

describe "/courses" do
  it "has at least one input elements", :points => 1, hint: h("label_for_input") do
    visit "/courses"

    expect(page).to have_css("input", minimum: 1)
  end
end

describe "/courses" do
  it "has a button with text 'Create course'", :points => 1, hint: h("copy_must_match") do
    visit "/courses"

    expect(page).to have_css("button", text: "Create course")
  end
end

describe "/courses" do
  it "creates a Course when 'Create course' form is submitted", :points => 5, hint: h("button_type label_for_input") do

    department = Department.new
    department.name = "Math"
    department.save

    initial_number_of_courses = Course.count
    test_title = "Calculus"

    visit "/courses"

    fill_in "Title", with: test_title
    select department.name, from: 'Department'
    click_on "Create course"
    final_number_of_courses = Course.count
    expect(final_number_of_courses).to eq(initial_number_of_courses + 1)
  end
end

describe "/courses" do
  it "saves the title when 'Create course' form is submitted", :points => 2, hint: h("label_for_input") do

    department = Department.new
    department.name = "Math"
    department.save

    initial_number_of_courses = Course.count
    test_title = "Calculus"

    visit "/courses"

    fill_in "Title", with: test_title
    select department.name, from: 'Department'
    click_on "Create course"

    last_course = Course.order(created_at: :asc).last
    expect(last_course.title).to eq(test_title)
  end
end


describe "/courses/[COURSE ID]" do
  it "displays the title of the course", :points => 1 do

    department = Department.new
    department.name = "Math"
    department.save

    course = Course.new
    course.title = "Calculus"
    course.term_offered = "Winter"
    course.department_id = department.id
    course.save

    visit "/courses/#{course.id}"

    expect(page).to have_content(course.title)
  end
end

describe "/delete_course/[COURSE ID]" do
  it "removes a record from the course table", :points => 1 do

    department = Department.new
    department.name = "Math"
    department.save

    course = Course.new
    course.title = "Calculus"
    course.term_offered = "Winter"
    course.department_id = department.id
    course.save

    visit "/delete_course/#{course.id}"

    expect(Course.exists?(course.id)).to be(false)
  end
end

describe "/delete_course/[COURSE ID]" do
  it "redirects to /courses", :points => 1, hint: h("redirect_vs_render") do

    department = Department.new
    department.name = "Math"
    department.save

    course = Course.new
    course.title = "Calculus"
    course.term_offered = "Winter"
    course.department_id = department.id
    course.save

    visit "/delete_course/#{course.id}"

    expect(page).to have_current_path("/courses")
  end
end

describe "/courses/[COURSE ID]" do
  it "has at least one form", :points => 1 do

    department = Department.new
    department.name = "Math"
    department.save

    course = Course.new
    course.title = "Calculus"
    course.term_offered = "Winter"
    course.department_id = department.id
    course.save

    visit "/courses/#{course.id}"

    expect(page).to have_css("form", minimum: 1)
  end
end

describe "/courses/[COURSE ID]" do
  it "has a label with text 'Title'", :points => 1, hint: h("copy_must_match label_for_input") do
 
    department = Department.new
    department.name = "Math"
    department.save

    course = Course.new
    course.title = "Calculus"
    course.term_offered = "Winter"
    course.department_id = department.id
    course.save

    visit "/courses/#{course.id}"

    expect(page).to have_css("label", text: "Title")
  end
end

describe "/courses/[COURSE ID]" do
  it "has a button with text 'Update course'", :points => 1, hint: h("copy_must_match label_for_input") do

    department = Department.new
    department.name = "Math"
    department.save

    course = Course.new
    course.title = "Calculus"
    course.term_offered = "Winter"
    course.department_id = department.id
    course.save

    visit "/courses/#{course.id}"

    expect(page).to have_css("button", text: "Update course")
  end
end

describe "/courses/[COURSE ID]" do
  it "'Update course' form has Title prepopulated in an input element", :points => 1, hint: h("value_attribute") do

    department = Department.new
    department.name = "Math"
    department.save

    course = Course.new
    course.title = "Calculus"
    course.term_offered = "Winter"
    course.department_id = department.id
    course.save

    visit "/courses/#{course.id}"

    expect(page).to have_css("input[value='#{course.title}']")
  end
end

describe "/courses/[COURSE ID]" do
  it "'Update course' form updates Title when submitted", :points => 1, hint: h("label_for_input button_type") do

    department = Department.new
    department.name = "Math"
    department.save

    course = Course.new
    course.title = "Calculus"
    course.term_offered = "Winter"
    course.department_id = department.id
    course.save

    new_title = "Algebra"

    visit "/courses/#{course.id}"
    fill_in "Title", with: new_title
    click_on "Update course"

    course_as_revised = Course.find(course.id)

    expect(course_as_revised.title).to eq(new_title)
  end
end

describe "/courses/[COURSE ID]" do
  it "'Update course' form redirects to the course's details page when updating course", :points => 1, hint: h("embed_vs_interpolate redirect_vs_render") do

    department = Department.new
    department.name = "Math"
    department.save

    course = Course.new
    course.title = "Calculus"
    course.term_offered = "Winter"
    course.department_id = department.id
    course.save

    new_title = "Algebra"

    visit "/courses/#{course.id}"
    fill_in "Title", with: new_title
    click_on "Update course"

    expect(page).to have_current_path("/courses/#{course.id}")
  end
end
