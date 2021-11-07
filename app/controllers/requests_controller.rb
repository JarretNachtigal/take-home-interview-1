class RequestsController < ApplicationController
  def show
    # this will call the api with given params (alderman and date) and print the relevent data from the response to the browser
    render json: {message: "thing"}
  end
end
