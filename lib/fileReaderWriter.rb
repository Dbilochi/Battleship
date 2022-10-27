class FileReaderWriter

  def read_and_get_file_data
    FileReaderWriter.open
    FileReaderWriter.read
    FileReaderWriter.file_attributes
  end

  def format(data)
    data_p = data.split(":")
    data_g = data_p.map { |s| s.split(",") }
    data_g
  end

  def write(data, result)
    File.open('result.txt', 'w') do |f|
      data.each_with_index  do |d,i|
        f.puts d[0]
        d[1][0].each do |d1|
          d1.each do |m|
            f.print ' '
            f.print m
          end
          f.print "\n"
        end
      end
      f.print "\n"
      data.each_with_index do |d,i|
        f.print d[0]
        f.print ' '
        f.print d[1][1]
        f.print "\n"
      end
      f.print "\n"
      f.print result
    end
  end

  private

  def self.open
    @file = File.open("battle.txt")
  end

  def self.read
    @file_data = @file.readlines.map(&:chomp)
  end


  def self.file_attributes
    @file_contents={}
    @file_contents['grid_size'] = @file_data[0]
    @file_contents['no_of_ship'] = @file_data[1]
    @file_contents['p1_ship_positions']=@file_data[2]
    @file_contents['p2_ship_positions']=@file_data[3]
    @file_contents['total_missiles']=@file_data[4]
    @file_contents['p1_target_position']=@file_data[5]
    @file_contents['p2_target_position']=@file_data[6]
    return @file_contents
  end


end