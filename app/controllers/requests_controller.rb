class RequestsController < ApplicationController
  def show
    # this will call the api with given params (alderman and date) and print the relevent data from the response to the browser
    response = HTTP.get("https://data.cityofchicago.org/resource/htai-wnw4.json").parse
    # response_two = HTTP.get("https://data.cityofchicago.org/resource/hec5-y4x5.json").parse
    response_three = HTTP.get("https://data.cityofchicago.org/resource/hec5-y4x5.json?creation_date=#{params[:year]}-#{params[:month]}-18T00:00:00.000").parse

    # reponse is array of hashes, [0] returns full info on 1 ward
    ward_data = "" # contians the ward with the given alderman
    response.each do |ward| 
      if ward["alderman"].include?(params[:alderman])
        ward_data = ward
      end
    end
    # full alderman name
    full_name = ward_data["alderman"]
    # ward number
    ward_number = ward_data["ward"]
    # number of reports created in given month
    reports = response_three.length
    data_render = {alderman: full_name, ward_number: ward_number, num_reports: reports, year: params[:year], month: params[:month]}
    render json: data_render.as_json
  end
end
