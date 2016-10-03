class AtmController < ApplicationController
  def index
    @result
    bank
    respond_to do |format|
      format.html
      #format.json do 
      #  render json: {
      #    total_amount: @bank.total_amount,
      #    atm_result: @result
      #  }.to_json
      #end
    end
  end
  
  def update
    result_of_updating
    #render action: 'index'
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
      render "index.json.jbuilder"
    end
end
