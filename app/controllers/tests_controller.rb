class TestsController < ApplicationController
  def query
    connection = ActiveRecord::Base.connection
    @p=connection.execute("SELECT * FROM products WHERE id=1;")

  end

end
