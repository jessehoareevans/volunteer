require('spec_helper')

describe(Volunteer) do
  describe('.all') do
    it("is empty at first") do
      expect(Volunteer.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("returns the volunteer's name") do
      test_volunteer = Volunteer.new({:name => "Harry", :project_id => 1, :id => nil})
      expect(test_volunteer.name()).to(eq("Harry"))
    end
  end

  describe("#save") do
    it("adds a volunteer to the array of saved volunteers") do
      test_volunteer = Volunteer.new({:name => "Harry", :project_id => 1, :id => nil})
      test_volunteer.save()
      expect(Volunteer.all()).to(eq([test_volunteer]))
    end
  end

  describe("#project_id") do
   it("lets you read the project ID") do
     test_volunteer = Volunteer.new({:name => "Harry", :project_id => 1, :id => nil})
     expect(test_volunteer.project_id()).to(eq(1))
   end
 end

  describe("#==") do
    it("is the same volunteer if it has the same name") do
      name1 = Volunteer.new({:name => "Bob", :project_id => 1, :id => nil})
      name2 = Volunteer.new({:name => "Bob", :project_id => 1, :id => nil})
      expect(name1).to(eq(name2))
    end
  end

  describe("#update") do
    it("lets you update volunteers in the database") do
      volunteer = Volunteer.new({:name => "Gary", :project_id => 1, :id => nil})
      volunteer.save()
      volunteer.update({:name => "Steve"})
      expect(volunteer.name()).to(eq("Steve"))
    end
  end

  describe("#delete") do
    it("lets you delete a volunteer from the database") do
      volunteer = Volunteer.new({:name => "Gary", :project_id => 1, :id => nil})
      volunteer.save()
      volunteer2 = Volunteer.new({:name => "Steve", :project_id => 1, :id => nil})
      volunteer2.save()
      volunteer.delete()
      expect(Volunteer.all()).to(eq([volunteer2]))
    end
  end

  describe("#delete") do
    it("lets you delete a volunteer from the database") do
      volunteer = Volunteer.new({:name => "Steve", :project_id => 1, :id => nil})
      volunteer.save()
      volunteer2 = Volunteer.new({:name => "Gary", :project_id => 1, :id => nil})
      volunteer2.save()
      volunteer.delete()
      expect(Volunteer.all()).to(eq([volunteer2]))
    end
  end
end
