class Account::TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.state = 'pending'
    @transaction.user = current_user
    @transaction.save!
    authorize @transaction

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Wallet credit",
        amount: @transaction.amount_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: account_transaction_url(@transaction),
      cancel_url: account_transaction_url(@transaction)
    )
    @transaction.update(checkout_session_id: session.id)
    session[:transaction_id] = @transaction.id
  end

  def show
    @transaction = Transaction.find(params[:id])
    authorize @transaction
  end

  def transaction_params
    params.permit(:amount)
  end
end

  # def new
  #   raise
  #   @transaction = current_user.transactions.where(state: 'pending').find(session[:transaction_id]) 
  # end

  # make a show method, which will do Transaction.find from params

