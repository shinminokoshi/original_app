require "#{Rails.root}/lib/import.rb"

# =データの取込

# データファイルを保存しているフォルダ
data_folder = "#{Rails.root}/db/fixtures/#{Rails.env}"

# ==ヘッダ情報の取込
Import.csv_read(data_folder, 'ヘッダ.csv') do |line, idx|
  Header.seed do |s|
    s.id    = idx
    s.title = line[0]
  end
end


# ==詳細情報の取込
Import.csv_read(data_folder, '詳細.csv') do |line, idx|
  Detail.seed do |s|
    s.id     = idx
    s.header = Header.find_by_title(line[0])
    s.name   = line[1]
    s.stock  = line[2]
  end
end