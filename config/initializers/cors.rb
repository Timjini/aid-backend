Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins "http://localhost:3000"
      resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end
  
    # allow do
    #   origins "*"
    #   resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    # end

    # allow do
    #   origins "https://aid--backend.herokuapp.com"
    #   resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    # end
    
    allow do
      origins 'https://aid-app.netlify.ap'
  
      resource 'https://aid--backend.herokuapp.com',
      headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end
  end