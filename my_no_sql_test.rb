require 'test/unit'
require 'my_no_sql'

class MyNoSqlTest < Test::Unit::TestCase

  # Execute fixtures.sql to set up for these tests (SOURCE fixtures.sql in the mysql prompt)
  
  def test_init

    my_no_sql = MyNoSql.new(
        :database => 'mynosql_test', 
        :table => 'users', 
        :columns => ['id', 'name', 'email'])
    
    assert_equal MyNoSql, my_no_sql.class
    assert_equal HandlerSocket, my_no_sql.hs.class
    
    assert_equal ["1", "Ross", "ross@example.com"], my_no_sql.fetch(1)   
    assert_equal ["2", "Colin", "colin@example.com"], my_no_sql.fetch(2)
    assert_equal [], my_no_sql.fetch(3)
    
  end
  
end