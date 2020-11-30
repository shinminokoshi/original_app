require 'csv'

# インポートファイルを読み込む
def import_read( file_name )
  lines = CSV.read("db/fixtures/#{Rails.env}/#{file_name}")
  lines.unshift([])  # index 0番目は空行を入れてスキップさせる

  lines.each_with_index do |line, idx|
    next unless line.length > 0

    yield(line, idx) if block_given?
  end
end

# CSVファイルの取込
import_read('restaurants_list.csv') do |line, idx|
  Hoge.seed do |s|
    s.id      = idx
    s.column1 = line[0]
    s.column2 = line[1]
  end
end