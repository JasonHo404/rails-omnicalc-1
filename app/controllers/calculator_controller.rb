class CalculatorController < ApplicationController

  def home
    render({template: "game_templates/square"})
  end

  def square
    render({template: "game_templates/square"})
  end

  def square_results
    @x = params.fetch("number").to_f
    @y = @x ** 2
    render({template: "game_templates/square_results"})
  end

  def square_root
    render({template: "game_templates/square_root"})
  end

  def square_root_results
    @x = params.fetch("user_number").to_f
    @y = Math.sqrt(@x)
    render({template: "game_templates/square_root_results"})
  end

  def payment
    render({template: "game_templates/payment"})
  end

  def payment_results
    @apr = params.fetch("user_apr").to_f.round(4)
    r = (params.fetch("user_apr").to_f / 100 )/ 12
    @years = params.fetch("user_years")
    n = @years.to_f * 12
    d1 = (1 + r)
    d2 = (n *-1)
   
    denominator = 1 - (d1 ** d2)
    @principal = params.fetch("user_pv").to_f
    @payment = (r * @principal)/denominator
    #@payment = @payment.to_s(:currency)
    #@user_apr = params.fetch("user_apr").to_f.to_fs(:percentage, {precision: 4})

    #@apr_result = apr.to_s(:percentage, { :precision => 4})
  
    render({template: "game_templates/payment_results"})
  end

  def random
    render({template: "game_templates/random"})
  end

  def random_results
    @x = params.fetch("user_min").to_f
    @y = params.fetch("user_max").to_f
    @z = rand(@x..@y)
    render({template: "game_templates/random_results"})
  end
end
