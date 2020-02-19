# frozen_string_literal: true

Rails.application.routes.draw do
  mount Payment::Engine => "/payment"
end
