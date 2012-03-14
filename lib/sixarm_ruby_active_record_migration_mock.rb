# -*- coding: utf-8 -*-
=begin rdoc
Please see README
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
