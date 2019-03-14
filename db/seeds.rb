# frozen_string_literal: true

Dir.glob(Rails.root.join("db/seeds/#{Rails.env}/*.rb")).sort.each do |file|
  require file
end
