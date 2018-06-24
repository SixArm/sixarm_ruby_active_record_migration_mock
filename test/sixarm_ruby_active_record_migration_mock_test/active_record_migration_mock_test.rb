# -*- coding: utf-8 -*-
require "sixarm_ruby_active_record_migration_mock_test"

class ActiveRecordMigrationMockTest < Minitest::Test
  def test_exist
    assert_instance_of(ActiveRecordMigrationMock, ActiveRecordMigrationMock.new)
  end
end
