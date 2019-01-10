require 'active_record'

def show(event:, context:)
  ActiveRecord::Base.establish_connection(
    adapter: 'mysql2',
    host: ENV['RDS_HOST'],
    username: ENV['RDS_USERNAME'],
    password: ENV['RDS_PASSWORD'],
    database: ENV['RDS_DATABASE']
  )

  {
    body: ActiveRecord::Base.connection.tables.to_json
  }
end
