# -*- coding: utf-8 -*-
require "sixarm_ruby_active_record_migration_mock_test"

class ActiveRecordMigrationColumnMockTest < Minitest::Test
  def test_exist
    name = "c"
    type = "x"
    options = {a: :b}
    assert_instance_of(ActiveRecordMigrationColumnMock, ActiveRecordMigrationColumnMock.new(name, type, options))
  end
end
