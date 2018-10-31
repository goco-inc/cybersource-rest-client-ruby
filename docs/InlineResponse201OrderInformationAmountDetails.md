# CyberSource::InlineResponse201OrderInformationAmountDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**total_amount** | **String** | Amount you requested for the payment or capture.  This value is returned for partial authorizations.  | [optional] 
**authorized_amount** | **String** | Amount that was authorized.  | [optional] 
**currency** | **String** | Currency used for the order. Use the three-character ISO Standard Currency Codes.  For an authorization reversal or a capture, you must use the same currency that you used in your request for Payment API.  | [optional] 

