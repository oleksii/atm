class AtmController < ApplicationController
  def index
    @result
    bank
    render "index.json.jbuilder"
  end
  
  def update
    result_of_updating
    render "index.json.jbuilder"
  end

  private
    def bank
      @bank = Bank.new
    end

    def result_of_updating
      @result =
      if params[:commit] == 'put money'
        bank.put_money(params)
      elsif params[:commit] == 'get money'
        bank.get_money(params)
      end
    end
end
