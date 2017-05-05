require('rspec')
require('volunteer')

describe(Volunteer) do
  before() do
    Volunteer.clear()
  end

  describe("#name") do
    it("returns the volunteer's name") do
      test_volunteer = Volunteer.new("Bob")
      expect(test_volunteer.name()).to(eq("Bob"))
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Volunteer.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a volunteer to the array of saved volunteers") do
      test_volunteer = Volunteer.new("wash the lion")
      test_volunteer.save()
      expect(Volunteer.all()).to(eq([test_volunteer]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved tasks") do
      Volunteer.new("wash the lion").save()
      Volunteer.clear()
      expect(Volunteer.all()).to(eq([]))
    end
  end
end
