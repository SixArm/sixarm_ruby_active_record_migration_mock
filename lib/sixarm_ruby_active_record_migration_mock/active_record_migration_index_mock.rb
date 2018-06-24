# -*- coding: utf-8 -*-

class ActiveRecordMigrationIndexMock
  attr_accessor :table_name
  attr_accessor :column_name

  def initialize(table_name, column_name)
    @table_name = table_name
    @column_name = column_name
  end

  def to_s
    "index table_name:#{table_name} column_name:#{column_name}"
  end

end
