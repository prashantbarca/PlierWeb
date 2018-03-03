class AddPcapFileToNewattachments < ActiveRecord::Migration[5.1]
  def up
    add_attachment :newattachments, :pcap_file
  end

  def down
    remove_attachment :newattachments, :pcap_file
  end  
end
