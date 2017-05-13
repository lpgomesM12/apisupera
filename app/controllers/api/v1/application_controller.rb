class Api::V1::ApplicationController < ActionController::Base
  # before_filter :set_default_format
  protect_from_forgery prepend: :true
  before_filter :cor

   def cor
     headers["Access-Control-Allow-Origin"]  = "*"
     headers["Access-Control-Allow-Methods"] = %w{GET POST PATCH PUT DELETE OPTIONS}.join(",")
     headers["Access-Control-Allow-Headers"] = "*" # %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
     head(:ok) if request.request_method == "OPTIONS"

   end

   protected

   def set_default_format
     request.format = "json"
   end
end
