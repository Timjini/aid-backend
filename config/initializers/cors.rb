Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000", "https://aid-app.netlify.app","http://localhost:5173","https://bikerace-colorado.vercel.app/","https://bikerace-oc.netlify.app/", "https://bikerace-colorado.vercel.app/"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end

end