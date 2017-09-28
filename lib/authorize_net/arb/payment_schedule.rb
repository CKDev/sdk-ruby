module AuthorizeNet::ARB

  # Models Payment Schedule.
  class PaymentSchedule
    
    include AuthorizeNet::Model
    
    attr_accessor :length, :unit, :start_date, :total_occurrences, :trial_occurrences

  end

end
