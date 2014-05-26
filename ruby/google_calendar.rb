require 'google/api_client'
require 'google/api_client/client_secrets'

client = Google::APIClient.new(
  application_name: 'pekobot',
  application_version: '0.0.1'
);

calendar = client.discovered_api('calendar', 'v3')

client_secrets = Google::APIClient::ClientSecrets.load('secret.json')
client.authorization = client_secrets.to_authorization
client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
client.authorization.fetch_access_token!

year = 2013
month = 7

time_min = Time.utc(year, month, 1, 0).iso8601
time_max = Time.utc(year, month, 31, 0).iso8601

params = {'calendarId' => 'primary',
          'orderBy' => 'startTime',
          'timeMax' => time_max,
          'timeMin' => time_min,
          'singleEvents' => 'True'}

p client.execute(
  api_method: calendar.events.list,
  parameters: params
).data

