CATEGORIES = ["Childcare", "Clubs", "Sport", "Support", "Health", "Learning",
  "Prenatal & Babies", "Music & Drama"]

Kaminari.configure do |config|
  config.default_per_page = ENV['DEFAULT_PER_PAGE'].to_i
  config.max_per_page = ENV['MAX_PER_PAGE'].to_i
end

Rails.logger.warn "APP_CATEGORIES is blank. Ignoring by default." if ENV['APP_CATEGORIES'].blank?