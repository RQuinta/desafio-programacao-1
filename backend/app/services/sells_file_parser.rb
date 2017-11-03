class SellsFileParser

  def initialize(path)
    @file = path
    @lines = @file.readlines
  end

  def parse
    uuid = SecureRandom.uuid
    @lines.shift
    @lines.map { |l|
      parsed_line = parse_line(l)
      parsed_line.uuid =  uuid
      parsed_line
    }
  end

  private

  def parse_line(line)
    attrs = line.split("\t")

    purchase_name = attrs[0]
    item_description = attrs[1]
    item_price = attrs[2]
    purchase_count = attrs[3]
    merchant_address = attrs[4]
    merchant_name = attrs[5]

    purchaser = Purchaser.find_or_create_by(name: purchase_name)
    item = Item.find_or_create_by(description: item_description, price: item_price)
    merchant = Merchant.find_or_create_by(name: merchant_name, address: merchant_address)
    sell_item = Sell.new(purchaser: purchaser, item: item, merchant: merchant, count: purchase_count)

    sell_item
  end

end
