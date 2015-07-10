# Ruby » <br> ActiveRecord migration mock object for testing Rails

* Doc: <http://sixarm.com/sixarm_ruby_active_record_migration_mock/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_active_record_migration_mock>
* Repo: <http://github.com/sixarm/sixarm_ruby_active_record_migration_mock>
<!--HEADER-SHUT-->


## Introduction

For docs go to <http://sixarm.com/sixarm_ruby_active_record_migration_mock/doc>

Want to help? We're happy to get pull requests.


<!--INSTALL-OPEN-->

## Install

To install using a Gemfile, add this:

    gem "sixarm_ruby_active_record_migration_mock", ">= 1.0.10", "< 2"

To install using the command line, run this:

    gem install sixarm_ruby_active_record_migration_mock -v ">= 1.0.10, < 2"

To install using the command line with high security, run this:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem && gem sources --add http://sixarm.com
    gem install sixarm_ruby_active_record_migration_mock -v ">= 1.0.10, < 2" --trust-policy HighSecurity

To require the gem in your code:

    require "sixarm_ruby_active_record_migration_mock"

<!--INSTALL-SHUT-->


## Example Migration


    class CreateFoosMigration < ActiveRecordMigrationMock

      def self.up
        create_table 'foos', :force => true do |t|
          t.column :abc,  :integer
          t.column :def,  :string
        end
        add_index 'foos', 'abc'
      end

      def self.down
        drop_table 'foos'
      end

    end


## Example Usage

    CreateFoosMigration.up

    ActiveRecordMigration.has_table?('foos') => true
    ActiveRecordMigration.has_table?('bars') => false

    tables = ActiveRecordMigration.tables

    table = ActiveRecordMigration.tables['foo']

    table.has_column?('abc') => true
    table.has_column?('xyz') => false

    table.has_index?('abc') => true
    table.has_index?('def') => false

    columns = table.columns

    column = table.columns['abc']
    column.type => :integer

    column = table.columns['def']
    column.type => :string

    indexes = table.indexes
    index = table.indexes['abc']

    index.table_name => 'foos'
    index.column_name => 'abc'
