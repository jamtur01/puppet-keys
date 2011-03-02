Puppet::Type.type(:keys).provide(:rpmkey) do
    desc "Manage Yum package repository keys"

    commands :rpm => "rpm"

    defaultfor :operatingsystem => [:redhat, :fedora, :centos, :oel, :ovm]

    def create
        rpm "--import", resources[:name]
    end

    def destroy
        rpm "-e", resource[:name]
    end

    def exists?
        rpm "-qa", "gpg-pubkey*"
        rpm "-qi", resource[:name]
    end
end
