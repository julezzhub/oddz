class StripeCheckoutSessionService
  def call(event)
    transaction = Transaction.find_by(checkout_session_id: event.data.object.id)
    transaction.update(state: 'paid')
    transaction.user.update(balance_cents: transaction.user.balance_cents + transaction.amount_cents)
  end
end