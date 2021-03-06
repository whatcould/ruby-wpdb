$:.unshift File.expand_path('../lib', File.dirname(__FILE__))
require 'bundler/setup'

require 'yaml'

require 'sequel'

require 'ruby-wpdb'

WPDB.from_config(Pathname(__FILE__) + ".." + ".." + "config.yml")

RSpec.configure do |c|
  c.around(:each) do |example|
    WPDB.db.transaction(rollback: :always){ example.run }
  end
end

require 'logger'
WPDB.db.logger = Logger.new('data/query.log')

