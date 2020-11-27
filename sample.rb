require "slack-notify"
require 'clockwork'
require 'active_support/time'

module Clockwork
  every(3.minutes, 'frequent.job') do
    sample = SlackNotify::Client.new(
      webhook_url: 'https://hooks.slack.com/services/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',
      channel: "#notify-test",
      username: "mybot")
      sample.notify("Hello There!")
  end
end
