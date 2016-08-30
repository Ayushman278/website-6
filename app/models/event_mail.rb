class EventMail < ApplicationRecord
  belongs_to :event

  def render_html(args = {})
    Mustache.render(html_template, template_vars(args))
  end

  def render_plain_text(args = {})
    Mustache.render(plain_text_template, template_vars(args))
  end

  private

    def template_vars(args)
      { location: event.location,
        token: get_token(args),
        rsvp_url: get_rsvp_url(args)}
    end

    #dup 1
    def get_token(args)
      if includes_rsvp && !!args[:member_token]
        args[:member_token].token
      else
        nil
      end
    end

    #dup 2
    def get_rsvp_url(args)
      if includes_rsvp && !!args[:rsvp_url]
        args[:rsvp_url]
      else
        nil
      end
    end
end
