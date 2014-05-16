class LibrariesWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perform(a,s,b)
    SiteMailer.status_email(a,s,b).deliver   
  end
end