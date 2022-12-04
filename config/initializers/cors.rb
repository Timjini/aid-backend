Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://aid-app.netlify.app/'
    resource 'https://fierce-badlands-13020.herokuapp.com/',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: false
  end
end