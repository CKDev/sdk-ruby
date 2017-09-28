module AuthorizeNet::ARB
  
  # Models a customer profile.
  class CustomerProfile < AuthorizeNet::Customer
    
    include AuthorizeNet::Model
    
    attr_accessor :merchant_customer_id, :customer_profile_id, :payment_profile, :description, :email
    
  end
  
end