=begin
#CyberSource Flex API

#Simple PAN tokenization service

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require 'spec_helper'
require 'json'

# Unit tests for CyberSource::TransactionDetailsApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'TransactionDetailsApi' do
  before do
    # run before each test
    @instance = CyberSource::TransactionDetailsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of TransactionDetailsApi' do
    it 'should create an instance of TransactionDetailsApi' do
      expect(@instance).to be_instance_of(CyberSource::TransactionDetailsApi)
    end
  end

  # unit tests for get_transaction
  # Retrieve a Transaction
  # Include the Request ID in the GET request to retrieve the transaction details.
  # @param id Request ID. 
  # @param [Hash] opts the optional parameters
  # @return [TssV2TransactionsGet200Response]
  describe 'get_transaction test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end