Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000"

    resource "*",
    headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end
  
    # allow do
    #   origins "https://aid-app.netlify.app"
    #   resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    # end

    # allow do
    #   origins "https://aid--backend.herokuapp.com"
    #   resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    # ends
    
    allow do
      origins "https://aid-app.netlify.app"
  
      resource "*",
      headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end
  end