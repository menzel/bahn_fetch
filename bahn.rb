require 'mechanize'
require 'logger'

agent = Mechanize.new
agent.user_agent_alias = 'Linux Mozilla'

page = agent.get('https://mobile.bahn.de/bin/mobil/query.exe/dox?country=DEU&rt=1&use_realtime_filter=1&webview=&searchMode=NORMAL')

form = page.forms[0] 

date = "#{Time.now.day}.#{Time.now.month}.#{Time.now.year}"
time = "#{Time.now.hour}:#{Time.now.min}"


form['queryPageDisplayed'] = 'yes'
form['REQ0JourneyStopsS0A'] = '1'
form['REQ0JourneyStopsS0K'] = 'S1-0N1'
form['REQ0JourneyStopsSG'] = ARGV[0]
form['REQ0JourneyStopsZ0A'] = '1'
form['REQ0JourneyStopsZG'] = ARGV[1]
form['REQ0JourneyStopsZ0K'] = 'S1-6N1'
form['REQ0JourneyDate'] = date
form['REQ0JourneyTime'] = time
form['existOptimizePrice'] = '1'
form['REQ0HafasSearchForw'] = '1'
form['REQ0HafasOptimze'] = '0%3A1'
form['REQ0Tariff_TravellerType.1'] = 'E'
form['REQ0Tariff_TravellerReductionClass.1'] = '0'
form['REQ0Tariff_Class'] = '2'
form['immediateAvail'] = 'ON'
form['start'] = 'Suchen'

search_results = agent.submit form
puts search_results.body
