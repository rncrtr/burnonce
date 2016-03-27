class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    # all of your application-specific code here - creating models,
    # processing reports, etc

    # here's an example of model creation
    log_dir = '/Users/shakycode/Dropbox/burnonce'
    log = Logger.new("#{log_dir}/griddler#{Time.now.strftime("%m-%d-%Y")}.log")
    log.info "email: #{@email.body} #{@email.from} #{@email.subject}"
  end
end
