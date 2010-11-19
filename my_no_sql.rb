require 'ruby-handlersocket/handlersocket'

class MyNoSql

  attr_accessor :hs
  
  def initialize( options = {}, host='127.0.0.1', port=9999 )
    database = options.delete(:database)
    table = options.delete(:table)
    columns = options.delete(:columns).join(",")
    
    self.hs = HandlerSocket.new( host, port )
    hs.open_index(3, database, table, 'PRIMARY', columns)
  end
  
  def fetch( id )
    result = hs.execute_single(3, '=', [ id ], 1, 0)
    if result.shift == 0
      result
    else
      raise "Some crazy error happened and we didn't get a zero return code from the query"
    end
  end
  
end