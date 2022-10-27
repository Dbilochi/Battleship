class FileReaderWriter

  def read_and_get_file_data
    FileReaderWriter.open
    FileReaderWriter.read
    FileReaderWriter.file_attributes
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