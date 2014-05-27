require 'google/api_client'
require 'google/api_client/client_secrets'
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

time_min = Time.utc(year, month, 1, 0).iso8601
time_max = Time.utc(year, month, 31, 0).iso8601

params = {'calendarId' => 'primary',
          'orderBy' => 'startTime',
          'timeMax' => time_max,
          'timeMin' => time_min,
          'singleEvents' => 'True'}

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
      dateTime: Time.utc(year, month, day, 18).iso8601.tap{|s| p s}
    },
    end: {
      dateTime: Time.utc(year, month, day, 19).iso8601
    },
    summary: 'test event'
  }.to_json
).data

p client.execute(
  api_method: calendar.events.list,
  parameters: params
).data

