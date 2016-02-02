class Url < ActiveRecord::Base

	# This is Sinatra! Remember to create a migration!
  def shorten 
    self.short_url_text = random_url
    self.save
  end

  def random_url  # Return a generated of a random url 
    url = SecureRandom.base64(2)
    url
  end
end
