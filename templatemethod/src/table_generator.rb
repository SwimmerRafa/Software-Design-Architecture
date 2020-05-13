# Template Method Pattern
# Date: 24-Feb-2020
# Authors:
#          A01378916 Rafael Moreno Cañas 
#          A01379896 Erick Bautista Pérez

# File name: table_generator.rb

# The source code contained in this file demonstrates how to
# implement the <em>template pattern</em>.

#A class that models a table representation
class TableGenerator

#Method that initiate all attributes
  def initialize(header, data)
    @header = header
    @data = data
  end

#Method that generate the table with the header and its data
  def generate
    generate_header_row + (@data.map {|x| generate_row(x)}).join
  end

#Method that generate all headers row of the table
  def generate_header_row
    (@header.map {|x| generate_header_item(x)}).join
  end

#Method that generate all items for the table
  def generate_item(item)
    item
  end

#Method that generate all rows for the table
  def generate_row(row)
    (row.map {|x| generate_item(x)}).join
  end

#Method that generate header items for the table
  def generate_header_item(item)
    item
  end

end

#Class that inherit TableGenerator and generates tables with ',' files
class CSVTableGenerator < TableGenerator

#Method that generate all rows for the table
  def generate_row(row)
    "#{(row.map {|x| generate_item(x)}).join(',')}\n"
  end

#Method that generate all headers row of the table
  def generate_header_row
    generate_row(@header)
  end

end

#Class that inherit TableGenerator and generates tables in HTML format
class HTMLTableGenerator < TableGenerator
  
#Method that generate the table with the header and its data
  def generate
    '<table>' + "\n" + generate_header_row + (@data.map {|x| generate_row(x)}).join + '</table>' + "\n"
  end

#Method that generate all headers row of the table
 def generate_header_row
   '<tr>' + '<th>' + "#{(@header.map {|x| generate_header_item(x)}).join('</th><th>')}" + '</th></tr>' + "\n"
 end
 
#Method that generate all rows for the table 
 def generate_row(row)
   '<tr>' + '<td>' + "#{(row.map {|x| generate_item(x)}).join('</td><td>')}" + '</td></tr>' + "\n"  
 end
 
end

#Class that inherit TableGenerator and generates tables with ASCII format
class AsciiDocTableGenerator < TableGenerator
  
 #Method that generate the table with the header and its data 
  def generate
  "[options=\"header\"]" + "\n" + '|==========' + "\n" + generate_header_row + (@data.map {|x| generate_row(x)}).join + '|==========' + "\n"
  end

#Method that generate all rows for the table
  def generate_row(row)
    '|' + "#{(row.map {|x| generate_item(x)}).join('|')}\n"
  end

#Method that generate all headers row of the table
  def generate_header_row
    generate_row(@header)
  end
  
  
end 