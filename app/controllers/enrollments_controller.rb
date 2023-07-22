class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.all.order({ :created_at => :desc })

    render({ :template => "enrollments/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @enrollment = Enrollment.where({:id => the_id }).at(0)

    render({ :template => "enrollments/show" })
  end

  def create
    @enrollment = Enrollment.new
    @enrollment.course_id = params.fetch("query_course_id")
    @enrollment.student_id = params.fetch("query_student_id")

    if @enrollment.valid?
      @enrollment.save
      redirect_to("/enrollments", { :notice => "Enrollment created successfully." })
    else
      redirect_to("/enrollments", { :notice => "Enrollment failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @enrollment = Enrollment.where({ :id => the_id }).at(0)

    @enrollment.course_id = params.fetch("query_course_id")
    @enrollment.student_id = params.fetch("query_student_id")

    if @enrollment.valid?
      @enrollment.save
      redirect_to("/enrollments/#{@enrollment.id}", { :notice => "Enrollment updated successfully."} )
    else
      redirect_to("/enrollments/#{@enrollment.id}", { :alert => "Enrollment failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @enrollment = Enrollment.where({ :id => the_id }).at(0)

    @enrollment.destroy

    redirect_to("/enrollments", { :notice => "Enrollment deleted successfully."} )
  end
end
