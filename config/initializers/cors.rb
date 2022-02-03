# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://jolly-panini-44dac4.netlify.app'
    resource '/admin/*', headers: :any, credentials: true, methods: [:get, :post, :patch, :put]
  end
end