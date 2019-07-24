require 'httparty'


namespace :news_api do
    desc "Fetches all news source descriptions, finds existing Source in DB by name and appends description"
    task :fetch_description => :environment do
        api_key = ENV["NEWS_API_SECRET"]
        response = HTTParty.get('https://newsapi.org/v2/sources?language=en&country=us&apiKey=deedda9426f9424c9b22cad4d24d3c08')
        response["sources"].each do |source|
            s = Source.find_by(name: source["name"])
            s.description = source["description"]
            s.save
        end
    end 
end 