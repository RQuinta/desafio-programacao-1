class SellsFileParser
  def initialize(file)
    @lines = file.readlines
  end

  def parse
    uuid = SecureRandom.uuid
    @lines.shift
    @lines.map do |l|
      parsed_line = parse_line(l)
      parsed_line.uuid = uuid
      parsed_line
    end
  end

  private

  def extract(attribute, line)
    case attribute
    when :purchase_name
      line[0]
    when :item_description
      line[1]
    when :item_price
      line[2]
    when :purchase_count
      line[3]
    when :merchant_address
      line[4]
    when :merchant_name
      line[5]
    end
  end

  def parse_line(line)
    attrs = line.split("\t")
    purchaser = Purchaser.find_or_initialize_by(name: extract(:purchase_name, attrs))
    item = Item.find_or_initialize_by(description: extract(:item_description, attrs), price: extract(:item_price, attrs))
    merchant = Merchant.find_or_initialize_by(name: extract(:merchant_name, attrs), address: extract(:merchant_address, attrs))
    Sell.new(purchaser: purchaser, item: item, merchant: merchant, count: extract(:purchase_count, attrs))
  end
end
