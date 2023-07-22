require "rails_helper"

describe "/departments" do
  it "lists the names of each Department record", points: 1 do
    
    english = Department.new
    english.name = "English"
    english.save
    
    technology = Department.new
    technology.name = "Technology"
    technology.save

    business = Department.new
    business.name = "Business"
    business.save

    visit "/departments"

    expect(page).to have_text("English")

    expect(page).to have_text("Technology")
    
    expect(page).to have_text("Business")

  end
end

describe "/departments/[DEPARTMENT ID]" do
  it "displays the name of the Department record", points: 1 do
    
    english = Department.new
    english.name = "English"
    english.save
    
    philosophy_101 = Course.new
    philosophy_101.title = "Philosophy 101"
    philosophy_101.term_offered = "Fall"
    philosophy_101.department_id = english.id
    philosophy_101.save

    advanced_theory = Course.new
    advanced_theory.title = "Advanced Theory"
    advanced_theory.term_offered = "Fall"
    advanced_theory.department_id = english.id
    advanced_theory.save

    visit "/departments/#{english.id}"

    expect(page).to have_text("English")

  end
end

describe "/departments/[DEPARTMENT ID]" do
  it "displays the number of Courses in the Department", points: 1 do
    
    english = Department.new
    english.name = "English"
    english.save
    
    philosophy_101 = Course.new
    philosophy_101.title = "Philosophy 101"
    philosophy_101.term_offered = "Fall"
    philosophy_101.department_id = english.id
    philosophy_101.save

    advanced_theory = Course.new
    advanced_theory.title = "Advanced Theory"
    advanced_theory.term_offered = "Fall"
    advanced_theory.department_id = english.id
    advanced_theory.save

    visit "/departments/#{english.id}"

    expect(page).to have_text(/number of courses\s*2/i),
      "Expected to find text, 'Number of courses 2', but didn't find it."

  end
end

describe "/departments/[DEPARTMENT ID]" do
  it "displays the titles of the Courses in the Department", points: 1 do
    
    english = Department.new
    english.name = "English"
    english.save

    technology = Department.new
    technology.name = "Technology"
    technology.save
    
    philosophy_101 = Course.new
    philosophy_101.title = "Philosophy 101"
    philosophy_101.term_offered = "Fall"
    philosophy_101.department_id = english.id
    philosophy_101.save

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

    visit "/departments/#{english.id}"

    expect(page).to have_text("Philosophy 101")
    expect(page).to have_text("Advanced Theory")
    expect(page).to_not have_text("Algorithms")

  end
end

describe "/departments/[DEPARTMENT ID]" do
  it "displays the titles of the Courses in the Department as links to the Course page", points: 1 do
    
    english = Department.new
    english.name = "English"
    english.save

    technology = Department.new
    technology.name = "Technology"
    technology.save
    
    philosophy_101 = Course.new
    philosophy_101.title = "Philosophy 101"
    philosophy_101.term_offered = "Fall"
    philosophy_101.department_id = english.id
    philosophy_101.save

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

    visit "/departments/#{english.id}"

    expect(page).to have_tag("a", :with => { :href => "/courses/#{philosophy_101.id}" }, :text => /Philosophy 101/i),
      "Expected page to have the a link with the text 'Philosophy 101' and an href of '/courses/#{philosophy_101.id}'"

    expect(page).to have_tag("a", :with => { :href => "/courses/#{advanced_theory.id}" }, :text => /Advanced Theory/i),
      "Expected page to have the a link with the text 'Advanced Theory' and an href of '/courses/#{advanced_theory.id}'"
    
    expect(page).to_not have_tag("a", :with => { :href => "/courses/#{algorithms.id}" }, :text => /Algorithms/i),
      "Expected page to have the a link with the text 'Algorithms' and an href of '/courses/#{algorithms.id}'"

  end
end
