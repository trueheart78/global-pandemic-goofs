class Env
  def self.production?
    ENV['APP_ENV'] == 'production'
  end

  def self.development?
    ENV['APP_ENV'] == 'development'
  end

  def self.test?
    ENV['APP_ENV'] == 'test'
  end

  def self.host(request)
    request.base_url
  end

  def self.domain(request)
    request.base_url.sub('https://','').sub('http://','')
  end

  def self.force_ssl?(request)
    self.production? && !request.ssl?
  end
end
