require 'httparty'


namespace :news_api do
    desc "Fetches all news sources from News API and creates Source objects out of them and persists to DB"
    task :fetch_sources => :environment do
        api_key = ENV["NEWS_API_SECRET"]
        response = HTTParty.get('https://newsapi.org/v2/sources?language=en&country=us&apiKey=deedda9426f9424c9b22cad4d24d3c08')
        response["sources"].each do |source|
            s = Source.new
            s.name = source["name"]
            s.save
        end
    end 
end 