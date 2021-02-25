class Env
  def self.production?
    ENV['RACK_ENV'] == 'production'
  end

  def self.development?
    ENV['RACK_ENV'] == 'development'
  end

  def self.test?
    ENV['RACK_ENV'] == 'test'
  end

  def self.host(request)
    request.base_url
  end

  def self.force_ssl?(request)
    self.production? && !request.ssl?
  end
end
