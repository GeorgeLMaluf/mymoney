# frozen_string_literal: true

# Class OffersController
class OffersController < ApplicationController
  def index
    @offers = Offer.enabled.order(premium: :desc)
  end
end
