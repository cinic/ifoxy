rails_env = ENV['RAILS_ENV'] || 'development'
#workers Integer(ENV['PUMA_WORKERS'] || 1)
#threads Integer(ENV['MIN_THREADS']  || 1), Integer(ENV['MAX_THREADS'] || 6)

#preload_app!

#rackup      DefaultRackup
#port        ENV['PORT']     || 3000
#environment ENV['RACK_ENV'] || 'development'

#on_worker_boot do
  # worker specific setup
#  ActiveSupport.on_load(:active_record) do
#    config = ActiveRecord::Base.configurations[Rails.env] ||
#                Rails.application.config.database_configuration[Rails.env]
#    config['pool'] = ENV['MAX_THREADS'] || 6
#    ActiveRecord::Base.establish_connection(config)
#  end
#end
preload_app!

workers 1
threads 1, 3
on_worker_boot do
  require "active_record"
  cwd = File.dirname(__FILE__)+"/.."
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection(ENV["DATABASE_URL"] || YAML.load_file("#{cwd}/config/database.yml")[ENV["RAILS_ENV"]])
end