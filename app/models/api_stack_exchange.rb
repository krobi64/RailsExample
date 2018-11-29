class ApiStackExchange
  include HTTParty
  base_uri 'api.stackexchange.com'

  def initialize(service='stackoverflow', page=1)
    @options = { query: { site: service, page: page } }
  end

  def questions
    self.class.get("/2.2/questions", @options)
  end
end