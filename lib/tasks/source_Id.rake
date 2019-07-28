require 'httparty'


namespace :news_api do
    desc "Fetches all news source ids and finds existing Source in DB by name and appends id"
    task :fetch_id => :environment do
        api_key = ENV["NEWS_API_SECRET"]
        response = HTTParty.get('https://newsapi.org/v2/sources?language=en&country=us&apiKey=deedda9426f9424c9b22cad4d24d3c08')
        response["sources"].each do |source|
            s = Source.find_by(name: source["name"])
            s.api_id = source["id"]
            s.save
        end
    end 
end 