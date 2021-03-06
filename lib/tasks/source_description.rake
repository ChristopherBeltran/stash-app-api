require 'httparty'



def strip_url(target_url)
    target_url.gsub("http://", "")
              .gsub("https://", "")
              .gsub("www.", "")
  end


namespace :news_api do
    desc "Fetches all news source descriptions, finds existing Source in DB by name and appends formatted url"
    task :fetch_url => :environment do
        api_key = ENV["NEWS_API_SECRET"]
        response = HTTParty.get('https://newsapi.org/v2/sources?language=en&country=us&apiKey=deedda9426f9424c9b22cad4d24d3c08')
        response["sources"].each do |source|
            s = Source.find_by(name: source["name"])
            s_url = strip_url(source["url"])
            s.url = s_url
            s.save
        end
    end 
end 