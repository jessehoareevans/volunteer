require("rspec")
require("pg")
require("project")
require("volunteer")
require("pry")

DB = PG.connect({:dbname => "volunteer_tracker_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM projects *;")
    DB.exec("DELETE FROM volunteers *;")
  end

  describe("#update") do
    it("lets you update volunteers in the database") do
      volunteer = List.new({:name => "Gary", :id => nil})
      volunteer.save()
      volunteer.update({:name => "Steve"})
      expect(volunteer.name()).to(eq("Steve"))
    end
  end
end
