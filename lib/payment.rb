# frozen_string_literal: true

require "payment/engine"

require 'rest-client'
require 'json'
require 'base64'
require 'uri'

# Errors
require_relative 'payment/errors/bills_payment_error'
require_relative 'payment/errors/authentication_error'
require_relative 'payment/errors/invalid_request_error'
require_relative 'payment/errors/connection_error'

# Actions
require_relative 'payment/actions/post'

# Resources
require_relative 'payment/payment_object'
require_relative 'payment/worker'

module Payment
  # Your code goes here...
end
