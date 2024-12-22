require 'nokogiri'
require 'open-uri'

# URL of the website to scrape
url = 'https://example.com'

# Fetch and parse HTML document
begin
  html = URI.open(url)
  doc = Nokogiri::HTML(html)

  # Example: Print the title of the page
  puts "Title: #{doc.title}"

  # Example: Print all links on the page
  doc.css('a').each do |link|
    puts "Link: #{link['href']}"
  end

rescue OpenURI::HTTPError => e
  puts "Failed to retrieve webpage: #{e.message}"
end
