response = HTTParty.get('https://rss.slashdot.org/Slashdot/slashdotMain')
xml_data = Nokogiri::XML(response.body)

items = xml_data.xpath('//x:item', 'x' => 'http://purl.org/rss/1.0/')

items.each do |item|
  title = item.at('title')&.text
  link = item.at('link')&.text
  description = item.at('description')&.text
#   creator = item.at_xpath('./dc:creator', 'dc' => 'http://purl.o
# rg/dc/elements/1.1/').text
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