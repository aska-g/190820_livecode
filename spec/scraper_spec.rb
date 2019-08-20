require_relative '../interface'
require_relative '../scraper'

describe "#fetch_movie_urls" do
  it "returns an array of movies" do
    urls = fetch_links
    expected = [
      "https://www.imdb.com/title/tt1213644/",
      "https://www.imdb.com/title/tt0270846/",
      "https://www.imdb.com/title/tt0060666/",
      "https://www.imdb.com/title/tt1316037/",
      "https://www.imdb.com/title/tt4458206/"
    ]
    expect(urls).to eq(expected)
  end
end

describe "#scrape_movie" do
  it "returns a Hash describing a movie" do
    the_dark_knight_url = "http://www.imdb.com/title/tt0468569/"
    movie = scrape_movie(the_dark_knight_url)

    expected = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008
    }
  end
end
