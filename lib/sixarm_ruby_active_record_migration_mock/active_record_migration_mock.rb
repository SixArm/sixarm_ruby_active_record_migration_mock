# -*- coding: utf-8 -*-

class ActiveRecordMigrationMock
	@@tables = {} # table name to table mock

	def self.tables
		@@tables
	end

	def self.has_table?(name)
		@@tables[name] != nil
	end

	def self.create_table(table_name, *_a)
		t = ActiveRecordMigrationTableMock.new(table_name)
		@@tables[table_name] = t
		yield t
		t
	end

	def self.add_index(table_name, column_name)
		(t = @@tables[table_name]) || raise("Table not found with name:#{table_name}")
		t.index(column_name)
	end

	def self.drop_table(table_name)
		@@tables.delete(table_name)
	end

end
