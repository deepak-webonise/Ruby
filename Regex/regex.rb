#/usr/bin/ruby -w
#Html scraping
file_html = File.open("states.html", "r")
file_csv = File.open("states.csv", "w")
file_csv_test = File.open("states_test.csv", "w")
html_content = file_html.readlines
html_content.each{
  |line| match = (line).scan(/(?<=<(?i:t).>)([\w\s]+)(?=<\/t.>)/i)
  if(match.length > 0)
   file_csv.puts(match.join(","))
  end
}
