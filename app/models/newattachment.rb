class Newattachment < ApplicationRecord
  has_attached_file :pcap_file
  validates_attachment_content_type :pcap_file, content_type: /.*/
  validates_with AttachmentPresenceValidator, attributes: :pcap_file
end
