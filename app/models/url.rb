class Url < ActiveRecord::Base
  before_create :random_url 
  validates :long_url_text, format: {with: /(http:\/\/|https:\/\/)(www.)([a-z]*.)(com|edu|org|net|gov|mil|biz|info|co.uk)/, messages: "Invalid URL address"}
	# This is Sinatra! Remember to create a migration!
  def shorten 
    self.short_url_text = random_url
    
  end

  def random_url  # Return a generated of a random url 
    url = SecureRandom.base64(2)
    url
  end

  def increment_counter
    self.click_count += 1
    self.save
  end
end
