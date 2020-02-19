# frozen_string_literal: true

module Payment
  class Worker < PaymentObject
    include Payment::Actions::Post

    def self.api_url
      'bills-payment/bill'
    end
  end
end
