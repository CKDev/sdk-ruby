module AuthorizeNet::ARB

  class SubscriptionInfo < AuthorizeNet::XmlResponse
    # Constructs a new response object from a +raw_response. You don't typically
    # construct this object yourself, as AuthorizeNet::ARB::Transaction will
    # build one for you when it makes the request to the gateway.
    def initialize(raw_response, transaction)
      super
      unless connection_failure?
        begin
          @subscription_detail = @root.at_css('subscription')
        rescue
          @raw_response = $!
        end
      end
    end

    def subscription
      build_entity(@subscription_detail, Fields::SUBSCRIPTION_INFO_ENTITY_DESCRIPTION)
    end

  end
end
