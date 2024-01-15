json.extract! article, :id, :title, :description, :link, :creator, :date, :subject, :created_at, :updated_at
json.url article_url(article, format: :json)
