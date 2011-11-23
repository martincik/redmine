
job_type :backup, 'cd :path && RAILS_ENV=:environment bundle exec backup perform -t :task -c ":path/config/backup.rb"'

every 1.day, :at => '2:00 am' do
  backup 'daily'
end
