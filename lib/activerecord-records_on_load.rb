require 'activerecord-records_on_load/version'
require 'active_record'
require 'active_record/records_on_load'

module ActiveRecord
  class Relation
    prepend ActiveRecord::RecordsOnLoad
  end
end
