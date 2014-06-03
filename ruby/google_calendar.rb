require 'google/api_client'
require 'google/api_client/client_secrets'
require 'active_support/core_ext'
require 'json'

client = Google::APIClient.new(
  application_name: 'pekobot',
  application_version: '0.0.1'
);

calendar = client.discovered_api('calendar', 'v3')

client_secrets = Google::APIClient::ClientSecrets.load('secret.json')
client.authorization = client_secrets.to_authorization
client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
client.authorization.fetch_access_token!

year = 2014
month = 5
day = 28

p client.execute(
  api_method: calendar.calendar_list.list,
  parameters: {
    calendarId: 'ryopeko@gmail.com'
  }
).data


my_calendar = client.execute(
  api_method: calendar.calendars.get,
  parameters: {
    calendarId: 'ryopeko@gmail.com'
  }
).data

p client.execute(
  api_method: calendar.events.insert,
  parameters: {
    calendarId: my_calendar.id
  },
  headers: {
    'Content-Type' => 'application/json'
  },
  body: {
    email: 'ryopeko@gmail.com',
    start: {
      dateTime: Time.new(year, month, day, 18).iso8601
    },
    end: {
      dateTime: Time.new(year, month, day, 19).iso8601
    },
    summary: 'test event'
  }.to_json
).data

p client.execute(
  api_method: calendar.events.list,
  parameters: {
    calendarId: 'primary',
  }
).data

