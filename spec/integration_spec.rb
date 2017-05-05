require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new project', {:type => :feature}) do
  it('allows a user to view volunteer and project details') do
    visit('/')
    click_link('Add New Project')
    fill_in('name', :with =>'Animal shelter')
    click_button('Add Project')
    expect(page).to have_content('Success!')
  end
end

describe('viewing all of the projects', {:type => :feature}) do
  it('allows a user to see all of the projects that have been created') do
    project = Project.new({:name => 'Animal shelter', :id => nil})
    project.save()
    visit('/')
    click_link('View All Projects')
    expect(page).to have_content(project.name)
  end
end

describe('seeing details of a single project', {:type => :feature}) do
  it('allows a user to click a project to see the details for it') do
    test_project = Project.new({:name => "Animal Shelter", :id => nil})
    test_project.save()
    test_volunteer = Volunteer.new({:name => "Larry", :project_id => test_project.id()})
    test_volunteer.save()
    visit('/projects')
    click_link(test_project.name())
    expect(page).to have_content(test_volunteer.name())
  end
end

describe('adding a volunteer to any project', {:type => :feature}) do
  it('allows a user to add a volunteer to a project') do
    test_project = Project.new({:name => 'Animal shelter', :id => nil})
    test_project.save()
    visit("/projects/#{test_project.id()}")
    fill_in("Name", {:with => "Gary"})
    click_button("Add volunteer")
    expect(page).to have_content("Success")
  end
end
