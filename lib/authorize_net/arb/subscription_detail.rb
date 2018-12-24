module AuthorizeNet::ARB
  # Models Subscription Detail.
  class SubscriptionDetail
    include AuthorizeNet::Model
    
    attr_accessor :id, :name, :status, :amount, :trial_amount, :create_time_stamp_utc, :first_name,
                  :last_name, :total_occurrences, :past_occurrences,
                  :payment_method, :account_number, :invoice, :amount, :currency_id,
                  :payment_schedule, :cust_profile, :invoice_num, :description
  end
end
