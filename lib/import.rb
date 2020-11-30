require 'csv'

#
# =データのImportをサポートするメソッド群
# Version:: 0.0.1
#
module Import

  # == CSVのインポートファイルを読み込む
  # 指定されたCSVファイルを読み込み、読み込んだデータを１行単位で配列に格納し、ブロックへ渡す。
  # ブロックへは、データ（配列）、Index（1～）を渡す。
  #
  # === 引数
  # - file_path ファイルパス
  # - file_name ファイル名称（省略可 デフォルト値=nil）
  # - header    ヘッダの有無（省略可 デフォルト値=false）
  #
  def self.csv_read( file_path, file_name=nil, header=false )
    file_path = File.expand_path(file_name, file_path) unless file_name.nil?

    lines = CSV.read(file_path)
    lines.unshift([]) unless header  # headerが無い場合は、index 0番目に空行を入れてスキップさせる

    lines.each_with_index do |line, idx|
      next if     idx == 0         # ヘッダ行は読み飛ばす
      next unless line.length > 0  # データが無い行は読み飛ばす

      yield(line, idx) if block_given?
    end
  end

end