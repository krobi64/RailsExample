class ApiStackExchange
  include HTTParty
  base_uri 'api.stackexchange.com'

  EMPTY_RESPONSE = {'items': []}.to_json
  def initialize(service='stackoverflow', page=1)
    @options = { query: { site: service, page: page } }
  end

  def questions
    begin
      self.class.get("/2.2/questions", @options).body
    rescue HTTParty::Error => e
      # TODO: Handle errors
      puts e
      return EMPTY_RESPONSE
    rescue ConnectionTimeoutError, SocketError => e
      puts e
      return EMPTY_RESPONSE
    end
  end
end