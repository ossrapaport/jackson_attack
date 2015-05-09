class SmsController < ApplicationController
  
  def create
    sms          = TwilioIntegration.new
    phone_number = "+1#{params[:phone_number]}"
    number_of_times      = params[:number_of_texts].to_i
    sender_name = params[:name]
    results = FlickrWrapper.search_for_jackson
    number_of_times.times do |i|  
      photo_url = FlickrWrapper.make_url(results.sample)
      message = IpsumWrapper.get_text
      if i === number_of_times - 1
        message = "Samuel, compliments of #{sender_name}"
      end
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