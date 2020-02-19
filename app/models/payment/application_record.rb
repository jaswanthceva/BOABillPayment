# frozen_string_literal: true

module Payment
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
