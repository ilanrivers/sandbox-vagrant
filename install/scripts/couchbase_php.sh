if [ -f "$COUCHBASE_SERVER" ]; then

    # PHP DIRS
    echo -e "\nInstalling Couchbase PHP Extension..."
    PHP_EXTENSION_DIR='/usr/lib64/php/modules'
    PHP_CONFIGURATION_DIR='/etc/php.d'

    cp "$COUCHBASE_TEMPLATES/couchbase.so" "$PHP_EXTENSION_DIR"
    cp "$COUCHBASE_TEMPLATES/z_couchbase.ini" "$PHP_CONFIGURATION_DIR"
    chmod 644 "$PHP_CONFIGURATION_DIR/z_couchbase.ini"

fi