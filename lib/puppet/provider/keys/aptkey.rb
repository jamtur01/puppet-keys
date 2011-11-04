Puppet::Type.type(:keys).provide(:aptkey) do
    desc "Manage apt-key package repository keys"

    commands :aptkey => "apt-key"

    defaultfor :operatingsystem => [:debian, :ubuntu]

    def create
      aptkey :add resources[:name]
    end

    def destroy
      aptkey :del resource[:name]
    end

    def exists?
      aptkey :list resource[:name]
    end
end
