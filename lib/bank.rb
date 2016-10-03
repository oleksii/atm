class Bank 
  attr_reader :coins

  def initialize
    @coins = Coin.all
  end

  def total_amount
    total_amount = 0
    coins.map { |c| c.denom * c.amount }.each { |v| total_amount += v }
    total_amount 
  end

  def put_money(params)
    type = params[:coin][:type]
    new_amount = params[:coin][:amount].to_i

    coin = coins.where(type: type).first
    if coin.update(amount: (coin.amount + new_amount))
      return "the #{new_amount} coins of denom #{coin.denom} was successfully added"
    else
      return 'something gone wrong'
    end
  end

  def get_money(params)
    amount_of_money = params[:coin][:amount].to_i
    if amount_of_money > total_amount
      return 'the desirable amount is bigger than total amount of money'
    else
      exchange = Exchanger.new(coins, amount_of_money)
      exchange.make
      if exchange.issue.empty?
        return 'there are not enough coins needed denomination'
      else
        return exchange.issue
      end
    end
  end
end
