Puppet::Type.type(:keys).provide(:rpmkey) do
    desc "Manage Yum package repository keys"

    commands :rpm => "rpm"

    defaultfor :operatingsystem => [:redhat, :fedora, :centos, :oel, :ovm]

    def create
      rpm "--import", "/etc/pki/rpm-gpg/#{resources[:name]}"
    end

    def destroy
      File.rm_fr("/etc/pki/rpm-gpg/#{resources[:name]}")
    end

    def exists?
      File.exists?("/etc/pki/rpm-gpg/#{resources[:name]}")
    end
end
