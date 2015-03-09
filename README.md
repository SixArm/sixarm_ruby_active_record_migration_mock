# Ruby » <br> ActiveRecord migration mock object for testing Rails

* Doc: <http://sixarm.com/sixarm_ruby_active_record_migration_mock/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_active_record_migration_mock>
* Repo: <http://github.com/sixarm/sixarm_ruby_active_record_migration_mock>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

For docs go to <http://sixarm.com/sixarm_ruby_active_record_migration_mock/doc>

Want to help? We're happy to get pull requests.


## Install quickstart

Install:

    gem install sixarm_ruby_active_record_migration_mock

Bundler:

    gem "sixarm_ruby_active_record_migration_mock", "~>1.0.8"

Require:

    require "sixarm_ruby_active_record_migration_mock"


## Install with security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_active_record_migration_mock --trust-policy HighSecurity


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


## Changes

* 2012-03-14 1.0.8 Update docs, tests
* 2011-10-06 1.0.8 Updates for gem publishing
## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind, 
express or implied, including but not limited to the warranties of 
merchantability, fitness for a particular purpose and noninfringement. 

In no event shall the authors or copyright holders be liable for any 
claim, damages or other liability, whether in an action of contract, 
tort or otherwise, arising from, out of or in connection with the 
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights, 
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2005-2015 Joel Parker Henderson
