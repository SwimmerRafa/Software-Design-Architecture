require 'aws-sdk-dynamodb'

dynamodb = Aws::DynamoDB::Client.new

book = {
  'Author' => 'Suzzanne Collins',
  'Title'  => 'Catching Fire',
  'Year'   => 2009,
  'Note'   => 'I don´t like this book'
}


dynamodb.put_item(table_name: 'Books', item: book)

puts 'Item has been successfully added'