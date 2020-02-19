# frozen_string_literal: true

module Payment
  module Actions
    module Post
      module ClassMethods
        def load_category
          response = RestClient.post 'http://14.98.171.134:9090/billspayment/bill/categories', {}
          JSON.parse(response.body)
        end

        def load_billers(id)
          response = RestClient.post "http://14.98.171.134:9090/billspayment/bill/getbillers/#{id}", {}
          JSON.parse(response.body)
        end

        def do_payment(payment_data)
          response = RestClient.post "http://14.98.171.134:9090/billspayment/bill/dopayment", payment_data
          JSON.parse(response.body)
        end
      end
      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
