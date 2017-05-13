require('spec_helper')

  describe(Project) do
    describe(".all") do
      it("starts off with no projects") do
        expect(Project.all()).to(eq([]))
    end
  end

  describe("#name") do
      it("tells you the project name") do
        project = Project.new({:name => "Animal shelter", :id => nil})
        expect(project.name()).to(eq("Animal shelter"))
    end
  end

  describe("#id") do
      it("sets its ID when you save it") do
        project = Project.new({:name => "Animal shelter", :id => nil})
        project.save()
        expect(project.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
      it("lets you save projects to the database") do
        project = Project.new({:name => "Animal shelter", :id => nil})
        project.save()
        expect(Project.all()).to(eq([project]))
    end
  end

  describe("#==") do
      it("is the same project if it has the same name") do
        project1 = Project.new({:name => "Animal shelter", :id => nil})
        project2 = Project.new({:name => "Animal shelter", :id => nil})
        expect(project1).to(eq(project2))
    end
  end

  describe(".find") do
   it("returns a project by its ID") do
     test_project = Project.new({:name => "Animal shelter", :id => nil})
     test_project.save()
     test_project2 = Project.new({:name => "Soup kitchen", :id => nil})
     test_project2.save()
     expect(Project.find(test_project2.id())).to(eq(test_project2))
   end
 end

  describe("#volunteers") do
    it("returns an array of volunteers for that project") do
      test_project = Project.new({:name => "Animal shelter", :id => nil})
      test_project.save()
      test_volunteer = Volunteer.new({:name => "Bob", :project_id => test_project.id()})
      test_volunteer.save()
      test_volunteer2 = Volunteer.new({:name => "Harry", :project_id => test_project.id()})
      test_volunteer2.save()
      expect(test_project.volunteers()).to(eq([test_volunteer, test_volunteer2]))
    end
  end

  describe("#update") do
    it("lets you update projects in the database") do
      project = Project.new({:name => "Animal shelter", :id => nil})
      project.save()
      project.update({:name => "Soup kitchen"})
      expect(project.name()).to(eq("Soup kitchen"))
    end
  end
end
