Puppet::Type.newtype(:keys) do
    @doc = "Manage package repository keys"

    ensurable

    newparam(:name) do
       desc "The name of the key being managed"

       isnamevar

    end
end
