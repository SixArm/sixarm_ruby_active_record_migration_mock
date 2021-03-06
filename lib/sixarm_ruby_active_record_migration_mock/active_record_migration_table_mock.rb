# -*- coding: utf-8 -*-

class ActiveRecordMigrationTableMock
  attr_accessor :name
  attr_accessor :columns
  attr_accessor :indexes

  def initialize(name)
    @name = name
    @columns = {}
    @indexes = {}
  end

  def to_s
    "table name:#{name}\n" + 
    @columns.values.map{|x| x.to_s + "\n"}.join + 
    @indexes.values.map{|x| x.to_s + "\n"}.join
  end

  def column(column_name, column_type, column_options = {})
    col = ActiveRecordMigrationColumnMock.new(column_name, column_type, column_options)
    @columns[column_name] = col
    col
  end

  def has_column?(column_name)
    @columns[column_name] != nil
  end

  def index(column_name)
    ind = ActiveRecordMigrationIndexMock.new(name, column_name)
    @indexes[column_name] = ind
    ind
  end

  def has_index?(column_name)
    @indexes[column_name] != nil
  end

end
