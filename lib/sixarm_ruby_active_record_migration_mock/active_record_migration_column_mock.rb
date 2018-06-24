# -*- coding: utf-8 -*-

class ActiveRecordMigrationColumnMock
  attr_accessor :name
  attr_accessor :type

  def initialize(name, type)
    @name = name
    @type = type
  end

  def to_s
    "name:#{name} type:#{type}"
  end
end
  