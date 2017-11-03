class SellsFileParser

  def initialize(path)
    @file = File.open(path, 'r')
    @lines = @file.readlines
    @sells = []
  end

  def parse
    uuid = SecureRandom.uuid
    @lines.shift!
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

    sell_item = SellItem.new(purchase_count: purchase_count)

    sell_item.purchaser = Purchaser.find_or_create_by(name: purchase_name)
    sell_item.item = Product.find_or_create_by(description: sell.item_description, price: sell.item_price)
    sell_item.merchant = Merchant.find_or_create_by(name: sell.merchant_name, address: sell.merchant_address)

    sell_item
  end

end
