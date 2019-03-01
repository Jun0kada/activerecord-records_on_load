$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'

Bundler.require

require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'test')

class User < ActiveRecord::Base
end

ActiveRecord::Migration.verbose = false

unless ActiveRecord::Base.connection.table_exists?('users')
  class CreateUserTable < ActiveRecord::Migration[4.2]
    def up
      create_table(:users) { |t| t.string :name }
    end
  end
  CreateUserTable.new.up
end
