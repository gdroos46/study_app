require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(Name Description)
  csv << csv_column_names
  @articles.each do |article|
    csv_column_values = [
      article.name,
      article.description
    ]
    csv << csv_column_values
  end
end