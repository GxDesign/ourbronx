class CausesController < ApplicationController
  include CausesHelper
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_cause, only: [:paypal, :show, :edit, :update, :destroy]

  def paypal
    # Goes in here after submitting the donation amount in the form
    redirect_to paypal_url(@cause, params[:amount])
  end

  def hook
    # Goes in here after payment went through (Paypal's callback url)
    #binding.pry
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]

    if status == "Completed"
      @cause = Cause.find(params[:item_number])
      amount_before_donation_in_cents = @cause.funded
      amount_donated_in_cents = params[:payment_gross].to_f*100
      total_amount_donated_in_cents = amount_before_donation_in_cents + amount_donated_in_cents

      @cause.update_attributes(
        notification_params: params,
        status: status,
        transaction_id: params[:txn_id],
        purchased_at: Time.now,
        funded: total_amount_donated_in_cents,
        amount_of_donations: @cause.amount_of_donations.next
      )

      #binding.pry
      # NameError (uninitialized constant CausesController::Donation):
      Donation.create!(
        uuid: params[:invoice],
        amount: amount_donated_in_cents,
        cause_id: @cause.id,
        user_id: params[:custom]
      )

      left_over_funds = total_amount_donated_in_cents - @cause.goal

      binding.pry

      if left_over_funds >= 0
        #Cause is complete
        Scholarship.create!(
          cause_id: @cause.id,
          title: @cause.title,
          amount: @cause.goal,
          amount_of_donors: Donation.pluck(:user_id).uniq.count
        )
        flash[:success] = "Congratulations! You have helped fund a new scholarship!"
      else
        flash[:notice] = "Thanks! You have succesfully donated #{amount_donated_in_cents} for #{@cause.title}."
      end
    end
    # To avoid Missing template causes/hook error
    render nothing: true # Since we are still in the paypal receipt page
  end

  def invoice
    # Goes in here when user selects to go back to our site from paypal
    binding.pry
    # TODO Find a way to get the flash messages in here (Also add back the navbar)
    #cause = Donation.last.cause
    #if !cause.scholarships.empty? && cause.scholarships.last
    #flash[:success] = "Congratulations! You have helped fund a new scholarship!"
    flash.keep
    redirect_to causes_path
  end
  # GET /causes
  # GET /causes.json
  def index
    @causes = Cause.all
  end

  # GET /causes/1
  # GET /causes/1.json
  def show
  end

  # GET /causes/new
  def new
    @cause = Cause.new
  end

  # GET /causes/1/edit
  def edit
  end

  # POST /causes
  # POST /causes.json
  def create
    @cause = Cause.new(cause_params)

    respond_to do |format|
      if @cause.save
        format.html { redirect_to @cause, notice: 'Cause was successfully created.' }
        format.json { render :show, status: :created, location: @cause }
      else
        format.html { render :new }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /causes/1
  # PATCH/PUT /causes/1.json
  def update
    respond_to do |format|
      if @cause.update(cause_params)
        format.html { redirect_to @cause, notice: 'Cause was successfully updated.' }
        format.json { render :show, status: :ok, location: @cause }
      else
        format.html { render :edit }
        format.json { render json: @cause.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /causes/1
  # DELETE /causes/1.json
  def destroy
    @cause.destroy
    respond_to do |format|
      format.html { redirect_to causes_url, notice: 'Cause was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cause
      @cause = Cause.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cause_params
      params[:cause]
    end
end
