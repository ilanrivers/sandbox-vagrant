if [ ! -f "$COUCHBASE_SERVER" ]; then

    echo -e "\nPreparing to install Couchbase Server..."

    # Move to Cache Dir
    cd "$VAGRANT_CACHE"

    if [ ! -f "couchbase-server-community_2.2.0_x86_64.rpm" ]; then
        echo "Downloading Couchbase Server..."
        wget "http://packages.couchbase.com/releases/2.2.0/couchbase-server-community_2.2.0_x86_64.rpm"
    fi

    echo "Installing Couchbase Server..."
    rpm -i "couchbase-server-community_2.2.0_x86_64.rpm"
    rpm -i "$COUCHBASE_TEMPLATES/libcouchbase2*"

fi
