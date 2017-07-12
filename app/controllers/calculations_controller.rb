class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @word_count = @text.split.count

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(/\s+/,"").length

    # @occurrences = @special_word.count
    # This you have to do a little more work on. Basically, I made the text into an array, then made a loop to test how many words matched the special word. Right now, this method you have here doesn't do anything
    
    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    @monthly_payment = ( (@apr/12)/100 /(1 - (1+ (@apr/12)/100)**-(@years*12 )))*@principal
   
    # I got this to work, but the monthly payment was wrong. Maybe check and make sure you're calculating the monthly payment correctlt? it should be
    #  M = P * ( J / (1 - (1 + J)-N)) where m =monthly payment, J=apr/12, and n = number of payments = years of the loan*12 p = principal
 
  
    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending - @starting
    @minutes = @seconds/60
    @hours = @minutes/60
    @days = @hours/24
    @weeks = @days/7
    @years = @days/365

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum

    @median = @numbers

    @sum = @numbers.sum

    @mean = @sum/@count

    @variance = 
    
    @standard_deviation = 
    
  #  variance = 0
#contents.each do |x|
 # variance = variance + (x[1].to_f - avg)**2
#variance = variance / contents.length
#variance = Math.sqrt(variance)


#def sample_variance
     # m = self.mean
     # sum = self.inject(0){|accum, i| accum +(i-m)**2 }
     # sum/(self.length - 1).to_f
   # end

  #  def standard_deviation
     # return Math.sqrt(self.sample_variance)
   # end

    @mode = "Replace this string with your answer."
    
    #arr = [ 1, 3, 44, 3 ]
    #most_frequent_item = arr.uniq.max_by{ |i| arr.count( i ) }

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
