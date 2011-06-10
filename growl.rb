# -*- coding: utf-8 -*-

require_if_exist 'rubygems'
require_if_exist 'ruby-growl'

Module.new do

  if defined? Growl
    GROWL = Growl.new '127.0.0.1', 'ruby-growl', ['ruby-growl Notification']
    Plugin::create(:growl).add_event(:popup_notify){ |user, text, &stop|
      text = text.to_show if text.is_a? Message
      u = "mikumiku"
      u = "@#{user[:idname]} (#{user[:name]})" if user
      GROWL.notify "ruby-growl Notification", u, text
      stop.call
    }
  end

end
