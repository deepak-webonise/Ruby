#/usr/bin/ruby -w
#Open html file in read mode
file_html = File.open("states.html", "r")

#Open csv file in write mode
file_csv = File.open("states.csv", "w")
file_csv_test = File.open("states_test.csv", "w")
html_content = file_html.readlines
html_content.each{
  |line| match = (line).scan(/(?<=<t.> | t.d>)([\w\s\d]*)(?=<\/t.>)/i)
  if(match.length > 0)
   file_csv.puts(match.join(","))
  end
}
file_html.close
file_csv.close