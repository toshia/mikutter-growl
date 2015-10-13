# -*- coding: utf-8 -*-

require_if_exist 'rubygems'
require_if_exist 'ruby_gntp'

Module.new do
  if defined? GNTP
    miku_icon = Skin.get("icon.png")
    growl = GNTP.new("mikutter")
    growl.register({
      :notifications => [{
        :name => "mikutter",
        :enabled => true,
        :icon => miku_icon
      }],
      :app_icon => miku_icon
    })
    Plugin::create(:growl).add_event(:popup_notify){ |user, text, &stop|
      text = text.to_show if text.is_a? Message
      title = "mikumiku"
      title = "@#{user[:idname]} (#{user[:name]})" if user
      growl.notify({
        :name => "mikutter",
        :title => title,
        :text => text,
        :icon => user[:profile_image_url],
        :sticky => false
      })
    }
  end
end
