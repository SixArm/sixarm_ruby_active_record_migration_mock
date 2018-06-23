# SixArm.com → Ruby → <br> ActiveRecord migration mock object for testing Rails

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_active_record_migration_mock.svg)](http://badge.fury.io/rb/sixarm_ruby_active_record_migration_mock)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_active_record_migration_mock.png)](https://travis-ci.org/SixArm/sixarm_ruby_active_record_migration_mock)
[![Code Climate](https://api.codeclimate.com/v1/badges/c439010bee8fb1221527/maintanability)](https://codeclimate.com/github/SixArm/sixarm_ruby_active_record_migration_mock/maintainability)

* Git: <https://github.com/SixArm/sixarm_ruby_active_record_migration_mock>
* Doc: <http://sixarm.com/sixarm_ruby_active_record_migration_mock/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_active_record_migration_mock>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [changes](CHANGES.md), [license](LICENSE.md), [contributing](CONTRIBUTING.md).

<!--header-shut-->


## Introduction

For docs go to <http://sixarm.com/sixarm_ruby_active_record_migration_mock/doc>

Want to help? We're happy to get pull requests.


<!--install-open-->

## Install

### Gem

To install this gem in your shell or terminal:

    gem install sixarm_ruby_active_record_migration_mock

### Gemfile

To add this gem to your Gemfile:

    gem 'sixarm_ruby_active_record_migration_mock'

### Require

To require the gem in your code:

    require 'sixarm_ruby_active_record_migration_mock'

<!--install-shut-->


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
