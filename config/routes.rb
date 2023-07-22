Rails.application.routes.draw do
  get("/", { :controller => "departments", :action => "index" })
  # Routes for the Department resource:
          
  # READ
  get("/departments", { :controller => "departments", :action => "index" })
  
  get("/departments/:path_id", { :controller => "departments", :action => "show" })

  #------------------------------

  # Routes for the Course resource:

  # READ
  get("/courses", { :controller => "courses", :action => "index" })
  
  get("/courses/:path_id", { :controller => "courses", :action => "show" })

  #------------------------------

  # Routes for the Enrollment resource:
          
  # READ
  get("/enrollments", { :controller => "enrollments", :action => "index" })
  
  get("/enrollments/:path_id", { :controller => "enrollments", :action => "show" })

  #------------------------------

  # Routes for the Student resource:

  # READ
  get("/students", { :controller => "students", :action => "index" })
  
  get("/students/:path_id", { :controller => "students", :action => "show" })

  #------------------------------

end
