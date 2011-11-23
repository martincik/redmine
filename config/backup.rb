ROOT_DIR  = ENV['ROOT_DIR'] || File.expand_path(File.dirname(__FILE__))
RAILS_ENV = ENV['RAILS_ENV'] || 'production'

def load_config(path)
  YAML.load_file(File.join(ROOT_DIR, path))[RAILS_ENV]
end

DB    = load_config("config/database.yml")
AWS   = load_config("config/aws.yml")
EMAIL = load_config("config/email.yml")

Backup::Model.new(:daily, 'Daily backup') do

  notify_by Mail do |mail|
    mail.on_failure           = true
    mail.on_success           = true
    mail.from                 = EMAIL['username']
    mail.to                   = "ladislav@foundum.com"
    mail.address              = "smtp.gmail.com"
    mail.port                 = '587'
    mail.domain               = "foundum.com"
    mail.user_name            = EMAIL['username']
    mail.password             = EMAIL['password']
    mail.authentication       = "plain"
    mail.enable_starttls_auto = true
  end

  database MySQL do |database|
    database.name               = DB["database"]
    database.username           = DB["username"]
    database.password           = DB["password"]
    database.host               = DB["host"] unless DB["host"].blank?
    database.additional_options = ['--single-transaction', '--quick']
  end

  archive :system do |archive|
    archive.add File.join(ROOT_DIR, "../../shared/files")
  end

  compress_with Gzip do |compression|
    compression.best = true
  end

  store_with S3 do |s3|
    s3.access_key_id      = AWS['access']
    s3.secret_access_key  = AWS['secret']
    s3.region             = 'eu-west-1'
    s3.bucket             = "redmine-foundum-com-backup"
    s3.keep               = :all
  end

end
