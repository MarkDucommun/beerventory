module ControllerHelpers
  def parse_json_response_body(response)
    JSON.parse(response.body).with_indifferent_access
  end
end
