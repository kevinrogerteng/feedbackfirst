describe 'db namespace rake task' do  
  before :all do 
    Rake.application.rake_require "tasks/populate"
    Rake::Task.define_task(:environment)
  end

  describe 'namespace :db' do  
    let :run_rake_task do
      Rake::Task["db:populate"].reenable
      Rake.application.invoke_task "db:populate"
    end

    it "should create a ticket"
  end
end