class EmailProcessor
  def initialize(email)
    @to = email.to.first[:email]
    @from = email.from[:email]
    @body = email.body
    @subject = email.subject
  end

  def process
    #log_dir = '/Users/shakycode/Dropbox/burnonce'
    #log = Logger.new("#{log_dir}/griddler#{Time.now.strftime("%m-%d-%Y")}.log")
    #log.info "body: #{@body} from: #{@from} to: #{@to} subject: #{@subject}"
    u = User.find_by(burn_email: @to)
    e = u.emails.create!(user_id: "1", from_email: @from, to_email: @to, subject: @subject, body: @body)
  end
end
