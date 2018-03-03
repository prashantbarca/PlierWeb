class AddPcapFileToAttachments < ActiveRecord::Migration[5.1]
  def change
    add_attachment :attachments, :pcap_file
  end
end
