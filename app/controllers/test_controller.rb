class TestController < ApplicationController
  def test
    json_response({message: 'OK'}, :ok)
  end
end
