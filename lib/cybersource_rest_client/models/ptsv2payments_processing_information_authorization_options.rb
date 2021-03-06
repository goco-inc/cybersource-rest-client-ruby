=begin
#CyberSource Flex API

#Simple PAN tokenization service

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require 'date'

module CyberSource
  class Ptsv2paymentsProcessingInformationAuthorizationOptions
    # Authorization type.  Possible values:   - **AUTOCAPTURE**: automatic capture.  - **STANDARDCAPTURE**: standard capture.  - **VERBAL**: forced capture. Include it in the payment request for a forced capture. Include it in the capture request for a verbal payment.  **Asia, Middle East, and Africa Gateway; Cielo; Comercio Latino; and CyberSource Latin American Processing**\\ Set this field to _AUTOCAPTURE_ and include it in a bundled request to indicate that you are requesting an automatic capture. If your account is configured to enable automatic captures, set this field to STANDARDCAPTURE and include it in a standard authorization or bundled request to indicate that you are overriding an automatic capture. For more information, see \"Automatic Captures,\" page 33.  **Forced Capture**\\ Set this field to _VERBAL_ and include it in the authorization request to indicate that you are performing a forced capture; therefore, you receive the authorization code outside the CyberSource system. For more information, see \"Forced Captures,\" page 123.  **Verbal Authorization**\\ Set this field to _VERBAL_ and include it in the capture request to indicate that the request is for a verbal authorization. For more information, see \"Verbal Authorizations,\" page 84.  For processor-specific information, see the auth_type field in [Credit Card Services Using the SCMP API.](http://apps.cybersource.com/library/documentation/dev_guides/CC_Svcs_SCMP_API/html) 
    attr_accessor :auth_type

    # Authorization code.  **Forced Capture**\\ Use this field to send the authorization code you received from a payment that you authorized outside the CyberSource system.  **Verbal Authorization**\\ Use this field in CAPTURE API to send the verbally received authorization code.  For processor-specific information, see the _auth_code_ field in [Credit Card Services Using the SCMP API.](http://apps.cybersource.com/library/documentation/dev_guides/CC_Svcs_SCMP_API/html) 
    attr_accessor :verbal_auth_code

    # Transaction ID (TID).
    attr_accessor :verbal_auth_transaction_id

    # Flag that specifies the purpose of the authorization.  Possible values:  - **0**: Preauthorization  - **1**: Final authorization  To set the default for this field, contact CyberSource Customer Support. See \"Final Authorization Indicator,\" page 119.  Barclays and Elavon The default for Barclays and Elavon is 1 (final authorization). To change the default for this field, contact CyberSource Customer Support.  CyberSource through VisaNet When the value for this field is 0, it corresponds to the following data in the TC 33 capture file5:  - Record: CP01 TCR0  - Position: 164  - Field: Additional Authorization Indicators When the value for this field is 1, it does not correspond to any data in the TC 33 capture file.  For processor-specific information, see the auth_indicator field in [Credit Card Services Using the SCMP API.](http://apps.cybersource.com/library/documentation/dev_guides/CC_Svcs_SCMP_API/html) 
    attr_accessor :auth_indicator

    # Flag that indicates whether the transaction is enabled for partial authorization or not. When your request includes this field, this value overrides the information in your CyberSource account.  For processor-specific information, see the _auth_partial_auth_indicator_ field in [Credit Card Services Using the SCMP API.](http://apps.cybersource.com/library/documentation/dev_guides/CC_Svcs_SCMP_API/html)  **CyberSource through VisaNet**\\ To set the default for this field, contact CyberSource Customer Support. The value for this field corresponds to the following data in the TC 33 capture file5: - Record: CP01 TCR0 - Position: 164 - Field: Additional Authorization Indicators  Possible values: - **true** Enable the transaction for partial authorization. - **false** Do not enable the transaction for partial authorization. 
    attr_accessor :partial_auth_indicator

    # Flag that indicates whether to return balance information.  Possible values: - **true** - **false** 
    attr_accessor :balance_inquiry

    # Flag that indicates whether to allow the capture service to run, even when the payment receives an AVS decline.  Possible values: - **true**  Ignore the results of AVS checking and run the capture service. - **false**  (default): If the authorization receives an AVS decline, do not run the capture service. 
    attr_accessor :ignore_avs_result

    # An array of AVS flags that cause the reply flag to be returned.  `Important` To receive declines for the AVS code N, include the value N in the array.  Possible values: - D - A - V - S - N - O 
    attr_accessor :decline_avs_flags

    # Flag that indicates whether to allow the capture service to run even when the payment receives a CVN decline.  Possible values: - **true**  Ignore the results of CVN checking and run the capture service. - **false**  (default) If the authorization receives a CVN decline, do not run the capture service. 
    attr_accessor :ignore_cv_result

    attr_accessor :initiator

    # Flag that indicates that this is a payment for a bill or for an existing contractual loan. See \"Visa Bill Payments,\" page 220, and \"Visa Debt Repayments,\" page 221, for lists of processors that support these features.  Possible values: - true: Bill payment or loan payment. - false (default): Not a bill payment or loan payment. 
    attr_accessor :bill_payment

    # Reason for the payment.  Possible values: - 001: Utility payment - 002: Government services - 003: Mobile phone top-up - 004: Coupon payment  The value for this field corresponds to the following data in the TC 33 capture file5: - Record: CP07 TCR0 - Position: 48-50 - Field: Bill Payment Transaction Type Identifier  This field is supported only for bill payments in Brazil with Mastercard on CyberSource through VisaNet. See Mastercard Bill Payments.  Note For information about bill payments with Visa, see Visa Bill Payments. 
    attr_accessor :bill_payment_type

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'auth_type' => :'authType',
        :'verbal_auth_code' => :'verbalAuthCode',
        :'verbal_auth_transaction_id' => :'verbalAuthTransactionId',
        :'auth_indicator' => :'authIndicator',
        :'partial_auth_indicator' => :'partialAuthIndicator',
        :'balance_inquiry' => :'balanceInquiry',
        :'ignore_avs_result' => :'ignoreAvsResult',
        :'decline_avs_flags' => :'declineAvsFlags',
        :'ignore_cv_result' => :'ignoreCvResult',
        :'initiator' => :'initiator',
        :'bill_payment' => :'billPayment',
        :'bill_payment_type' => :'billPaymentType'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'auth_type' => :'String',
        :'verbal_auth_code' => :'String',
        :'verbal_auth_transaction_id' => :'String',
        :'auth_indicator' => :'String',
        :'partial_auth_indicator' => :'BOOLEAN',
        :'balance_inquiry' => :'BOOLEAN',
        :'ignore_avs_result' => :'BOOLEAN',
        :'decline_avs_flags' => :'Array<String>',
        :'ignore_cv_result' => :'BOOLEAN',
        :'initiator' => :'Ptsv2paymentsProcessingInformationAuthorizationOptionsInitiator',
        :'bill_payment' => :'BOOLEAN',
        :'bill_payment_type' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'authType')
        self.auth_type = attributes[:'authType']
      end

      if attributes.has_key?(:'verbalAuthCode')
        self.verbal_auth_code = attributes[:'verbalAuthCode']
      end

      if attributes.has_key?(:'verbalAuthTransactionId')
        self.verbal_auth_transaction_id = attributes[:'verbalAuthTransactionId']
      end

      if attributes.has_key?(:'authIndicator')
        self.auth_indicator = attributes[:'authIndicator']
      end

      if attributes.has_key?(:'partialAuthIndicator')
        self.partial_auth_indicator = attributes[:'partialAuthIndicator']
      end

      if attributes.has_key?(:'balanceInquiry')
        self.balance_inquiry = attributes[:'balanceInquiry']
      end

      if attributes.has_key?(:'ignoreAvsResult')
        self.ignore_avs_result = attributes[:'ignoreAvsResult']
      else
        self.ignore_avs_result = false
      end

      if attributes.has_key?(:'declineAvsFlags')
        if (value = attributes[:'declineAvsFlags']).is_a?(Array)
          self.decline_avs_flags = value
        end
      end

      if attributes.has_key?(:'ignoreCvResult')
        self.ignore_cv_result = attributes[:'ignoreCvResult']
      else
        self.ignore_cv_result = false
      end

      if attributes.has_key?(:'initiator')
        self.initiator = attributes[:'initiator']
      end

      if attributes.has_key?(:'billPayment')
        self.bill_payment = attributes[:'billPayment']
      end

      if attributes.has_key?(:'billPaymentType')
        self.bill_payment_type = attributes[:'billPaymentType']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@auth_type.nil? && @auth_type.to_s.length > 15
        invalid_properties.push('invalid value for "auth_type", the character length must be smaller than or equal to 15.')
      end

      if !@verbal_auth_code.nil? && @verbal_auth_code.to_s.length > 7
        invalid_properties.push('invalid value for "verbal_auth_code", the character length must be smaller than or equal to 7.')
      end

      if !@verbal_auth_transaction_id.nil? && @verbal_auth_transaction_id.to_s.length > 15
        invalid_properties.push('invalid value for "verbal_auth_transaction_id", the character length must be smaller than or equal to 15.')
      end

      if !@auth_indicator.nil? && @auth_indicator.to_s.length > 1
        invalid_properties.push('invalid value for "auth_indicator", the character length must be smaller than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@auth_type.nil? && @auth_type.to_s.length > 15
      return false if !@verbal_auth_code.nil? && @verbal_auth_code.to_s.length > 7
      return false if !@verbal_auth_transaction_id.nil? && @verbal_auth_transaction_id.to_s.length > 15
      return false if !@auth_indicator.nil? && @auth_indicator.to_s.length > 1
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] auth_type Value to be assigned
    def auth_type=(auth_type)
      if !auth_type.nil? && auth_type.to_s.length > 15
        fail ArgumentError, 'invalid value for "auth_type", the character length must be smaller than or equal to 15.'
      end

      @auth_type = auth_type
    end

    # Custom attribute writer method with validation
    # @param [Object] verbal_auth_code Value to be assigned
    def verbal_auth_code=(verbal_auth_code)
      if !verbal_auth_code.nil? && verbal_auth_code.to_s.length > 7
        fail ArgumentError, 'invalid value for "verbal_auth_code", the character length must be smaller than or equal to 7.'
      end

      @verbal_auth_code = verbal_auth_code
    end

    # Custom attribute writer method with validation
    # @param [Object] verbal_auth_transaction_id Value to be assigned
    def verbal_auth_transaction_id=(verbal_auth_transaction_id)
      if !verbal_auth_transaction_id.nil? && verbal_auth_transaction_id.to_s.length > 15
        fail ArgumentError, 'invalid value for "verbal_auth_transaction_id", the character length must be smaller than or equal to 15.'
      end

      @verbal_auth_transaction_id = verbal_auth_transaction_id
    end

    # Custom attribute writer method with validation
    # @param [Object] auth_indicator Value to be assigned
    def auth_indicator=(auth_indicator)
      if !auth_indicator.nil? && auth_indicator.to_s.length > 1
        fail ArgumentError, 'invalid value for "auth_indicator", the character length must be smaller than or equal to 1.'
      end

      @auth_indicator = auth_indicator
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          auth_type == o.auth_type &&
          verbal_auth_code == o.verbal_auth_code &&
          verbal_auth_transaction_id == o.verbal_auth_transaction_id &&
          auth_indicator == o.auth_indicator &&
          partial_auth_indicator == o.partial_auth_indicator &&
          balance_inquiry == o.balance_inquiry &&
          ignore_avs_result == o.ignore_avs_result &&
          decline_avs_flags == o.decline_avs_flags &&
          ignore_cv_result == o.ignore_cv_result &&
          initiator == o.initiator &&
          bill_payment == o.bill_payment &&
          bill_payment_type == o.bill_payment_type
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [auth_type, verbal_auth_code, verbal_auth_transaction_id, auth_indicator, partial_auth_indicator, balance_inquiry, ignore_avs_result, decline_avs_flags, ignore_cv_result, initiator, bill_payment, bill_payment_type].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = CyberSource.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
