if ENV['CATEGORIES'].blank?
  Rails.logger.warn "CATEGORIES is blank. Using Clackskids defaults."
  CATEGORIES = ["Childcare", "Clubs", "Sport", "Support", "Health", "Learning",
    "Prenatal & Babies", "Music & Drama"]
elsif ENV['CATEGORIES'].class == String
  CATEGORIES = ENV['CATEGORIES'].split(",")
else
  CATEGORIES = ENV['CATEGORIES']
end

Kaminari.configure do |config|
  config.default_per_page = ENV['DEFAULT_PER_PAGE'].to_i
  config.max_per_page = ENV['MAX_PER_PAGE'].to_i
end

Rails.logger.warn "PREREQUISITE_CATEGORY is blank. Ignoring by default." if ENV['PREREQUISITE_CATEGORY'].blank?