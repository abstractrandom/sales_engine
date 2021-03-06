require 'csv'
require 'pry'

class InvoiceItemParser
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def parse
    file = CSV.open(@filename, :headers => true, :header_converters => :symbol)
    file.map do |line|
      InvoiceItem.new(line, self)
    end
  end
  
end
