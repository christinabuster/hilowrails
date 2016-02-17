#GameController class inherits from ApplicationController
class GameController < ApplicationController

  #method try contains
  def try

    #params takes information from the browser and assigns a value to the instance (temporary) variable @guess
    @guess = params[:guess]

    if session[:secret].nil?
      # creates a random number between 1 and 100 and stores it in a cookie called secret, session keeps the cookie information encryted
      session[:secret] = rand(100)
      # random number assigns to a cookie, giving it an instance variable @secret. cookie returns the integer to a string.
      # @secret = cookies[:secret]
    end

    #if statement: when the user's guess which is @guess instance variable (converted to an integer with .to_i) is greater than :secret (rand(random number)) print (@result) "Too High"
    if @guess.to_i > session[:secret].to_i
      @result = "Too High!"

    # if the user guess isn't too high (else) check if the guess is less than < the random number print "Too Low"
     elsif @guess.to_i < session[:secret].to_i
      @result = "Too Low!"

    # else the user guess is equal to the random numer print "correct"
    else
      @guess.to_i == session[:secret].to_i
      @result = "Correct!"
      # when user guess is correct create a new random number between 1 and 100
      session[:secret] = rand(100)
    end
  end

end
