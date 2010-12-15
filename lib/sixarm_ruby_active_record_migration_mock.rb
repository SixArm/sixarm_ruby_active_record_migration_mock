# -*- encoding: utf-8 -*-
=begin rdoc

= SixArm Ruby Gem » ActiveRecord Migration Mock

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2009-2010 Joel Parker Henderson
License:: Your choice of BSD, MIT, LGPL, or CreativeCommons Non-commercial Share Alike

ActiveRecord migration mock object for testing our Ruby On Rails gems.

This is useful when you don't want to connect to the real database.

==Example Migration

  class CreateFoosMigration < ActiveRecordMigrationMock

   def self.up
     create_table 'foos', :force => true do |t|
       t.column :abc,  :integer
       t.column :def,  :string
     end
     add_index 'foos', 'abc'
   end

   def self.down
     drop_table 'foos'
   end

 end

==Example Usage

  CreateFoosMigration.up

  ActiveRecordMigration.has_table?('foos') => true
  ActiveRecordMigration.has_table?('bars') => false

  tables = ActiveRecordMigration.tables

  table = ActiveRecordMigration.tables['foo']

  table.has_column?('abc') => true
  table.has_column?('xyz') => false

  table.has_index?('abc') => true
  table.has_index?('def') => false

  columns = table.columns
  
  column = table.columns['abc']
  column.type => :integer

  column = table.columns['def']
  column.type => :string

  indexes = table.indexes
  index = table.indexes['abc']

  index.table_name => 'foos'
  index.column_name => 'abc'

=end


class ActiveRecordMigrationMock

  @@tables={} # table name to table mock

 def self.tables
   @@tables
 end

 def self.has_table?(name)
   @@tables[name]!=nil
 end

 def self.create_table(table_name,*a)
   t = ActiveRecordMigrationTableMock.new(table_name)
   @@tables[table_name]=t
   yield t
   return t
 end

 def self.add_index(table_name,column_name)
   t=@@tables[table_name] or raise "Table not found with name:#{table_name}"
   t.index(column_name)
 end

 def self.drop_table(table_name)
   @@tables.delete(table_name)
 end

end


class ActiveRecordMigrationTableMock

 attr_accessor :name
 attr_accessor :columns
 attr_accessor :indexes

 def initialize(name)
   @name=name
   @columns={}
   @indexes={}
 end

 def to_s
   return "table name:#{name} " + @columns.values.join("\n") + " " + @indexes.values.join("\n")
 end

 def column(column_name,column_type)
   col = ActiveRecordMigrationColumnMock.new(column_name,column_type)
   @columns[column_name]=col
   return col
 end

 def has_column?(column_name)
   @columns[column_name]!=nil
 end

 def index(column_name)
   ind = ActiveRecordMigrationIndexMock.new(name,column_name)
   @indexes[column_name]=ind
   return ind
 end

 def has_index?(column_name)
   @indexes[column_name]!=nil
 end

end


class ActiveRecordMigrationColumnMock

  attr_accessor :name
  attr_accessor :type

  def initialize(name,type)
    @name=name
    @type=type
  end

  def to_s
    "column name:#{name} type:#{type}"
  end

end

class ActiveRecordMigrationIndexMock

  attr_accessor :table_name
  attr_accessor :column_name

  def initialize(table_name,column_name)
    @table_name=table_name
    @column_name=column_name
  end

  def to_s
    "index table_name:#{table_name} column_name:#{column_name}"
  end

end
