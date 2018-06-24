# -*- coding: utf-8 -*-
require "sixarm_ruby_active_record_migration_mock_test"

class IntegratinoTest < Minitest::Test

  def test_migration
    CreateFoosMigration.up                                                                   

    assert_equal(true,  ActiveRecordMigrationMock.has_table?('foos'),'has_table foos')
    assert_equal(false, ActiveRecordMigrationMock.has_table?('bars'),'has_table bars')

    tables = ActiveRecordMigrationMock.tables
    refute_nil(tables,'tables hash')

    table=tables['foos']
    refute_nil(table,'table foos')

    assert_equal(true,  table.has_column?(:abc),'has_column abc')
    assert_equal(true,  table.has_column?(:def),'has_column def')
    assert_equal(false, table.has_column?(:xyz),'has_column xyz')

    assert_equal(true,  table.has_index?(:abc),'has_index abc')
    assert_equal(false, table.has_index?(:def),'has_index def')
    assert_equal(false, table.has_index?(:xyz),'has_index xyz')

    assert_equal(:integer, table.columns[:abc].type, 'column abc type:integer')
    assert_equal(:string,  table.columns[:def].type, 'column def type:string') 

  end

end

