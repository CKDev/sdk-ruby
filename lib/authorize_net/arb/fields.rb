module AuthorizeNet::ARB
    module Fields
      EntityDescription = Struct.new(:node_structure, :entity_class, :arg_mapping)

      SUBSCRIPTION_PAYMENT_SCHEDULE_ENTITY_DESCRIPTION = AuthorizeNet::EntityDescription.new(
        [
          {:interval => [
            {:length => :length, :_converter => :value_to_integer},
            {:unit => :unit}
          ]},
          {:startDate => :start_date, :_converter => proc { |v| Time.parse(v) }},
          {:totalOccurrences => :total_occurrences, :_converter => :value_to_integer},
          {:trialOccurrences => :trial_occurrences, :_converter => :value_to_integer}
        ],
        AuthorizeNet::ARB::PaymentSchedule
      )

      SUBSCRIPTION_PROFILE_FIELDS = AuthorizeNet::EntityDescription.new(
        [
          {:merchantCustomerId => :cust_id},
          {:description => :description},
          {:email => :email},
          {:customerProfileId => :customer_profile_id},
          {:paymentProfile => AuthorizeNet::CIM::Fields::PAYMENT_PROFILE_ENTITY_DESCRIPTION, :_value => :payment_profile}
        ],
        AuthorizeNet::ARB::CustomerProfile
      )

      SUBSCRIPTION_INFO_ENTITY_DESCRIPTION = AuthorizeNet::EntityDescription.new(
        [
          {:id => :id},
          {:name => :name},
          {:status => :status},
          {:createTimeStampUTC => :create_time_stamp_utc},
          {:firstName => :first_name},
          {:lastName => :last_name},
          {:totalOccurrences => :total_occurrences},
          {:pastOccurrences => :past_occurrences},
          {:paymentMethod => :payment_method},
          {:accountNumber => :account_number},
          {:invoice => :invoice},
          {:amount => :amount, :_converter => :value_to_decimal},
          {:trialAmount => :trial_amount, :_converter => :value_to_decimal},
          {:paymentSchedule => SUBSCRIPTION_PAYMENT_SCHEDULE_ENTITY_DESCRIPTION, :_value => :payment_schedule},
          {:profile => SUBSCRIPTION_PROFILE_FIELDS, :_value => :cust_profile},
          {:order => [
            {:invoiceNumber => :invoice_num},
            {:description => :description}
          ]}
        ],
        AuthorizeNet::ARB::SubscriptionDetail
      )

      SUBSCRIPTION_DETAIL_ENTITY_DESCRIPTION = EntityDescription.new(
        [
          {:id => :id},
          {:name => :name},
          {:status => :status},
          {:createTimeStampUTC => :create_time_stamp_utc},
          {:firstName => :first_name},
          {:lastName => :last_name},
          {:totalOccurrences => :total_occurrences},
          {:pastOccurrences => :past_occurrences},
          {:paymentMethod => :payment_method},
          {:accountNumber => :account_number},
          {:invoice => :invoice},
          {:amount => :amount},
          {:currencyId => :currency_id}
        ],
        AuthorizeNet::ARB::SubscriptionDetail
      )

    end
end
