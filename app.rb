require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/volunteer")
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})

get("/") do
  @volunteers = Volunteer.all()
  erb(:index)
end

post("/volunteers") do
  name = params.fetch("name")
  volunteer = Volunteer.new(name)
  volunteer.save()
  erb(:success)
end
