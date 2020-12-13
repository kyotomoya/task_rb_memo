require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.chomp

if memo_type == "1"
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp
  file = File.open("#{file_name}.csv","w")
  puts "メモしたい内容を入力してください"
  memo_text = gets.chomp
  file.puts("#{memo_text}")
  file.close
  
elsif memo_type == "2"
  puts "既存のメモを編集します"
  puts "1(編集先のデータの上書き) 2(編集先のデータに追記)"

  edit_type = gets.chomp
    if edit_type == "1"
      puts "データを上書きします"
      puts "編集したいファイル名を入力してください"
      file_name = gets.chomp
      file = File.open("#{file_name}.csv", "w+") #上書き
      puts "保存されているメモを上書きします"
      puts "上書きしたい内容を入力してください"
      memo_text = gets.chomp
      file.puts("#{memo_text}")
      file.close

    elsif edit_type == "2"
      puts "データに追記します"
      puts "編集したいファイル名を入力してください"
      file_name = gets.chomp
      file = File.open("#{file_name}.csv", "a+") #末尾に追加
      puts "保存されているメモに追記します"
      puts "現在保存されているメモは以下の通りです"
      puts file.read
      puts "追記したい内容を入力してください"
      memo_text = gets.chomp
      file.puts("#{memo_text}")
      file.close
    else
      puts "条件に一致しません"
    end
else 
  puts "条件に一致しません"
end

