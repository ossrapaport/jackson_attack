class SmsController < ApplicationController
  before_action :authenticate

  def create
    sms          = TwilioIntegration.new
    phone_number = "+1#{params[:phone_number]}"
    number_of_times      = params[:number_of_texts].to_i - 1

    number_of_times.times do |i|  
      photo_url = FlickrWrapper.make_url(results.sample)
      message = IpsumWrapper.get_text
      logger.info sms.send(phone_number, message, photo_url)
    end
    
    render json: {msg: "Success!"}
  end

  def show
    @phone_number = params[:phone_number]
    @message      = URI.decode params[:message]
  end

  private

    def authenticate
      unless logged_in?
        redirect_to new_session_path
      end
    end
end