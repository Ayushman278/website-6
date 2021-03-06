class EventMailer < ApplicationMailer
  after_action :log

  def invitation(member, event_mail)
    @member = member
    @event_mail = event_mail
    basic_email(  to: to,
                  subject: subject,
                  html: html,
                  text: plain_text)
  end

  private

  # def from
  #   @event_mail
  # end

    def to
      @member.email
    end

    def subject
      @event_mail.subject
    end

    def html
      @event_mail.render_html(template_vars)
    end

    def plain_text
      @event_mail.render_plain_text(template_vars)
    end

    def template_vars
      p "============ how does rsvp_url work from the routes??? -- oliver diamond"
      p rsvp_url(token: @member.token)
      { member: @member,
        rsvp_url: rsvp_url(token: @member.token) }
    end

    def log
      @member.add_notes("Sending EventMail ##{ @event_mail.id }: SENT")
      @event_mail.add_logs([@member])
    end

end
