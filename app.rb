require_relative "connection.rb"
require_relative "exporter.rb"
include Connection_tools
# Was used in testing purposes to see the request format
require "json"

company_domain = ENV["pipedrive_company_domain"]
uri = "https://#{company_domain}.pipedrive.com"
key = "?api_token="+ENV["pipedrive_api"]

conn = ConnectionManager.getConnection(uri, key)
pd = PipdriveService.new(conn)

## TODO: Create method for acception input arguments that will define script behaviour
begin
  ar = pd.getOrganizations() #By modifying current call gets different api requests and generates different files
rescue Exception => ex
  puts ex.to_s
end

begin
  Export.toCSV(ar)
rescue Exception => ex
  puts ex.to_s
end
