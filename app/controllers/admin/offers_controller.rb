# frozen_string_literal: true

module Admin
  # AdminOffersController
  class OffersController < Admin::ApplicationController
    before_action :set_offer, except: %w[index create new]

    def index
      @offers = Offer.all
    end

    def show; end

    def new
      @offer = Offer.new
    end

    def edit; end

    def create
      @offer = Offer.new(offer_params)

      respond_to do |format|
        if @offer.save
          format.html { redirect_to [:admin, @offer], notice: 'Offer was successfully created.' }
          format.json { render :show, status: :created, location: @offer }
        else
          format.html { render :new }
          format.json { render json: @offer.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @offer.update(offer_params)
          format.html { redirect_to [:admin, @offer], notice: 'Offer was successfully updated.' }
          format.json { render :show, status: :ok, location: @offer }
        else
          format.html { render :edit }
          format.json { render json: @offer.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @offer.destroy
      respond_to do |format|
        format.html { redirect_to [:admin, @offer], notice: 'Offer was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    def disable
      respond_to do |format|
        if @offer.update(status: :disabled)
          format.html { redirect_to [:admin, @offer], notice: 'Offer was successfully disabled.' }
        else
          format.html { redirect_to [:admin, @offer], notice: 'There was an error.' }
        end
        format.json { render :show, status: :ok, location: @offer }
      end
    end

    def enable
      respond_to do |format|
        if @offer.update(status: :enabled)
          format.html { redirect_to [:admin, @offer], notice: 'Offer was successfully enabled.' }
        else
          format.html { redirect_to [:admin, @offer], notice: 'There was an error.' }
        end
        format.json { render :show, status: :ok, location: @offer }
      end
    end

    private

    def set_offer
      @offer = Offer.find(params[:id])
    end

    def offer_params
      params.require(:offer).permit(:advertiser_name, :description, :url, :premium, :starts_at, :ends_at)
    end
  end
end
