require('spec_helper')

describe(Volunteer) do
  describe('.all') do
    it("is empty at first") do
      expect(Volunteer.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("returns the volunteer's name") do
      test_volunteer = Volunteer.new({:name => "Harry", :project_id => 1})
      expect(test_volunteer.name()).to(eq("Harry"))
    end
  end

  describe("#save") do
    it("adds a volunteer to the array of saved volunteers") do
      test_volunteer = Volunteer.new({:name => "Harry", :project_id => 1})
      test_volunteer.save()
      expect(Volunteer.all()).to(eq([test_volunteer]))
    end
  end

  describe("#project_id") do
   it("lets you read the project ID") do
     test_volunteer = Volunteer.new({:name => "Harry", :project_id => 1})
     expect(test_volunteer.project_id()).to(eq(1))
   end
 end

  describe("#==") do
    it("is the same volunteer if it has the same name") do
      name1 = Volunteer.new({:name => "Bob", :project_id => 1})
      name2 = Volunteer.new({:name => "Bob", :project_id => 1})
      expect(name1).to(eq(name2))
    end
  end
end
