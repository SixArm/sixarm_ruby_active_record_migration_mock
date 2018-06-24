# -*- coding: utf-8 -*-
require "sixarm_ruby_active_record_migration_mock_test"

class ActiveRecordMigrationTableMockTest < Minitest::Test
  def test_exist
    name = "t"
    assert_instance_of(ActiveRecordMigrationTableMock, ActiveRecordMigrationTableMock.new(name))
  end
end
