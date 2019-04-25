class MailManagerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "------------ Sending Mail ------------"
  end
end
