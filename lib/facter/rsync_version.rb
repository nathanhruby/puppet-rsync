# Make rsync_version facts so we can automaticlly use &include style synctax on newer rsyncs
#
# example output to parse
# rsync  version 3.1.0dev  protocol version 31.PR14
# rsync  version 3.0.6  protocol version 30
# rsync  version 2.6.8  protocol version 29

rsync_cmd = '/usr/bin/env rsync'
version = %x[#{rsync_cmd} --version | head -1].split(' ')

Facter.add(:rsync_version) do
  setcode do
    version[2]
  end
end

Facter.add(:rsync_protocol_version) do
  setcode do
    version[5]
  end
end

