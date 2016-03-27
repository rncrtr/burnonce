class EmailsController < ApplicationController

  def process(email)
    log_dir = '/Users/shakycode/Dropbox/burnonce'
    log = Logger.new("#{log_dir}/griddler#{Time.now.strftime("%m-%d-%Y")}.log")
    log.info "email: #{email.from}"
  end
end
