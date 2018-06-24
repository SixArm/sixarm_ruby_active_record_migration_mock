# -*- coding: utf-8 -*-

[
  "active_record_migration_mock",
  "active_record_migration_table_mock",
  "active_record_migration_column_mock",
  "active_record_migration_index_mock",
].each{|x|
  require_relative "sixarm_ruby_active_record_migration_mock/#{x}"
}