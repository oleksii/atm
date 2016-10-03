class Exchanger
attr_reader :issue

  def initialize(coins, amount)
    @amount = amount
    @coins = coins
    @issue = {}
  end

  def make
    @coins.to_a.each do |coin|
      if @amount > 0 && @amount / coin.denom > 0 && coin.amount > 0 
        @amount -= coin.denom
        coin.update(amount: (coin.amount - 1))

        if @issue.keys.include?(coin.denom)
          @issue[coin.denom] += 1
        else
          @issue[coin.denom] = 1
        end

        if @amount > 0
          redo
        else
          return
        end
        return
      end
    end

    if @amount != 0
      @issue.each do |k, v|
        coin = @coins.find_by(denom: k)
        coin.update(amount: coin.amount + @issue[k])
      end
      @issue = {} 
    end
  end
end
