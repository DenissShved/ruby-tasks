require 'httparty'
require_relative "objects.rb"
include Objects
module Connection_tools

  class Connection
    attr_accessor :accessKey, :uri
    def initialize(uri, accessKey)
        @uri, @accessKey = uri, accessKey
    end
  end

  class ConnectionManager
    def self.getConnection(uri, accessKey)
      return Connection.new(uri, accessKey)
    end
  end

  class PipdriveService
    attr_accessor :connection
    def initialize(connection)
      @connection = connection
    end

    def retrieveData(path)
      response = HTTParty.get(connection.uri+path+connection.accessKey)
      if response.code != 200
        raise ("Request faield with code: " + response.code.to_s)
      end
      return response
    end

    # These methods return arrays of objects
    def getUsers() #:name, :default_currency, :locale
      returnArray = []
      retrieveData("/v1/users")["data"].each do |item|
        returnArray << User.new(item["name"], item["default_currency"], item["locale"])
      end
      return returnArray
    end
    def getDeals()
      returnArray = []
      retrieveData("/v1/deals")["data"].each do |item|
        returnArray << Deal.new(item["title"], item["person_id"]["name"], item["org_id"]["name"], item["value"], item["currency"])
      end
      return returnArray
    end
    def getCurrencies()
      returnArray = []
      retrieveData("/v1/currencies")["data"].each do |item|
        returnArray << Currency.new(item["id"], item["code"], item["name"])
      end
      return returnArray
    end
    def getOrganizations()
      returnArray = []
      retrieveData("/v1/organizations")["data"].each do |item|
        returnArray << Organization.new(item["name"], item["open_deals_count"], item["people_count"])
      end
      return returnArray
    end
    def getActivities()
      returnArray = []
      retrieveData("/v1/activities")["data"].each do |item|
        returnArray << Activity.new(item["org_name"], item["person_name"], item["deal_title"], item["type"])
      end
      return returnArray
    end
  end
end
