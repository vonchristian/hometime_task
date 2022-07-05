class ApplicationController < ActionController::API
  def success_response_with_top_level_message(serialized_object, status_code = :ok, message = 'Success')
    serialized_hash = serialized_object.serializable_hash
    serialized_hash['message'] = message
    render json: serialized_hash, status: status_code
  end
  
  def error_response(response_error_payload, status_code)
    render json: response_error_payload, status: status_code
  end
end
