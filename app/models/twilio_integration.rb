class TwilioIntegration
  attr_reader :client, :account

  def initialize
    @client  = TwilioHelper::CLIENT
    @account = @client.account
  end

  def send(phone_number, message, media)
    @account.messages.create(
      from: TwilioHelper::PHONE,
      to:   phone_number,
      body: message,
      media_url: media
    )
  end
end