# This file will be called by running rails db:seed

# 1. Clearing the DB
Article.destroy_all

# 2. Calling the slashdot rss feed
response = HTTParty.get('https://rss.slashdot.org/Slashdot/slashdotMain')
xml_data = Nokogiri::XML(response.body)

items = xml_data.xpath('//x:item', 'x' => 'http://purl.org/rss/1.0/')

# 3. Parsing each item from the response and creating a new Article
items.each do |item|
  title = item.at('title')&.text
  link = item.at('link')&.text
  description = item.at('description')&.text
  creator = item.at_xpath('.//*[local-name()="creator"]')&.text
  maybe_date = item.at_xpath('./dc:date', 'dc' => 'http://purl.org/dc/elements/1.1/')
  date = maybe_date ? DateTime.parse(maybe_date) : nil

  subject = item.at('dc:subject')&.text

  ::Article.create!(
    title: title,
    link: link,
    description: description,
    creator: creator,
    date: date,
    subject: subject,
    read_status: false,
  )
end