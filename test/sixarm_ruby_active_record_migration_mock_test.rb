# -*- coding: utf-8 -*-
require "minitest/autorun"
require "simplecov"
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
])
SimpleCov.start
require "sixarm_ruby_active_record_migration_mock"

class CreateFoosMigration < ActiveRecordMigrationMock

  def self.up
    create_table 'foos', :force => true do |t|
      t.column :abc,  :integer
      t.column :def,  :string
    end
    add_index 'foos', :abc
  end

  def self.down 
   drop_table 'foos'
  end 

end
