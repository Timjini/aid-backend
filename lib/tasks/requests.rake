namespace :requests do
  desc "Delete records older than 10 minutes"
  task delete_10_minutes_old: :environment do
    Request.where(['created_at < ?', 10.minutes.ago]).destroy_all
  end

end
