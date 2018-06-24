# -*- coding: utf-8 -*-
require "sixarm_ruby_active_record_migration_mock_test"

class ActiveRecordMigrationTableMockTest < Minitest::Test

  def test_exist
    name = "t"
    assert_instance_of(ActiveRecordMigrationTableMock, ActiveRecordMigrationTableMock.new(name))
  end

  def test_to_s
    name = "t"
    table = ActiveRecordMigrationTableMock.new(name)
    column_1_name = "c1n"
    column_1_type = "c1t"
    column_1_options = {}
    column_2_name = "c2n"
    column_2_type = "c2t"
    column_2_options = {}
    table.column(column_1_name, column_1_type, column_1_options)
    table.column(column_2_name, column_2_type, column_2_options)
    table.index(column_1_name)
    table.index(column_2_name)
    expect = "table name:#{name}\ncolumn name:#{column_1_name} type:#{column_1_type} options:#{column_1_options}\ncolumn name:#{column_2_name} type:#{column_2_type} options:#{column_2_options}\nindex table_name:#{name} column_name:#{column_1_name}\nindex table_name:#{name} column_name:#{column_2_name}\n"
    actual = table.to_s
    assert_equal(expect, actual)
  end

  def test_column
    name = "t"
    table = ActiveRecordMigrationTableMock.new(name)
    column_1_name = "c1n"
    column_1_type = "c1t"
    table.column(column_1_name, column_1_type)
    assert_equal(1, table.columns.size)
    assert_equal(column_1_name, table.columns[column_1_name].name)
    assert_equal(column_1_type, table.columns[column_1_name].type)
  end

  def test_has_column
    name = "t"
    table = ActiveRecordMigrationTableMock.new(name)
    column_1_name = "c1n"
    column_1_type = "c1t"
    column_2_name = "c2n"
    column_2_type = "c2t"
    table.column(column_1_name, column_1_type)
    assert(table.has_column?(column_1_name))
    refute(table.has_column?(column_2_name))
  end

  def test_index
    name = "t"
    table = ActiveRecordMigrationTableMock.new(name)
    column_name = "c"
    table.index(column_name)
    assert_equal(1, table.indexes.size)
    assert_equal(name, table.indexes[column_name].table_name)
    assert_equal(column_name, table.indexes[column_name].column_name)
  end

  def test_has_index
    name = "t"
    table = ActiveRecordMigrationTableMock.new(name)
    index_1_name = "i1n"
    index_2_name = "i2n"
    table.index(index_1_name)
    assert(table.has_index?(index_1_name))
    refute(table.has_index?(index_2_name))
  end
  
end
