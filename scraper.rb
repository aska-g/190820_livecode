require 'open-uri'
require 'nokogiri'

def fetch_links
  bottom_movies_url = 'https://www.imdb.com/chart/bottom'

  html_file = open(bottom_movies_url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.titleColumn a').first(5).map do |element|
    "https://www.imdb.com#{element['href']}"
  end
end

def scrape_movie(link)
  html_file = open(link).read
  html_doc = Nokogiri::HTML(html_file)

  cast = html_doc.search('.cast_list tr img').first(3).map do |cast_list|
    cast_list['title']
  end

  summary = html_doc.search('.plot_summary .summary_text').first.text.strip
  title_and_year = html_doc.search('.title_wrapper h1').first.text.strip
  title = title_and_year[0..-8]
  year = title_and_year[-5..-2]

  director = html_doc.search('.plot_summary .credit_summary_item a').first.text

  movies = { title: title, year: year, director: director, storyline: summary, cast: cast }
end

def save_to_yaml(results)
  filepath = 'movies.yml'

  File.open(filepath, 'wb') do |file|
    file.write(results.to_yaml)
  end
end
