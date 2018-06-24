# -*- coding: utf-8 -*-

class ActiveRecordMigrationColumnMock
  attr_accessor :name
  attr_accessor :type
  attr_accessor :options
  
  def initialize(name, type, options = {})
    @name = name
    @type = type
    @options = options
  end

  def to_s
    "column name:#{name} type:#{type} options:#{options.inspect}"
  end
end
  