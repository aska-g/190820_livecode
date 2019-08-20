require 'yaml'
require_relative 'scraper'

# find the correct links (array?) from the list of bottom movies
links = fetch_links

results = links.map do |link|
  # for each link, visit the page and retrieve: cast, director, storyline, title, year
  scrape_movie(link)
end

# save it to a yml file
save_to_yaml(results)
