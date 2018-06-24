# -*- coding: utf-8 -*-
require "sixarm_ruby_active_record_migration_mock_test"

class ActiveRecordMigrationIndexMockTest < Minitest::Test
  def test_exist
    table_name = "t"
    column_name = "c"
    assert_instance_of(ActiveRecordMigrationIndexMock, ActiveRecordMigrationIndexMock.new(table_name, column_name))
  end
end
