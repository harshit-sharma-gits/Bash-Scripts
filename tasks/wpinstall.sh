#!/bin/bash

# Function to install required packages
install_packages() {
    sudo apt update
    sudo apt install -y apache2 mysql-server php libapache2-mod-php php-mysql
}

# Function to configure MySQL and create a WordPress database and user
configure_mysql() {
    # Secure MySQL installation

    # Create a WordPress database and user
    sudo systemctl enable mysql
    read -p "Enter your MySQL root password: " rootpass
    echo "CREATE DATABASE wordpress;" | sudo mysql -u root -p$rootpass
    echo "CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'wppassword';" | sudo mysql -u root -p$rootpass
    echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';" | sudo mysql -u root -p$rootpass
    echo "FLUSH PRIVILEGES;" | sudo mysql -u root -p$rootpass
}

# Function to download and configure WordPress
configure_wordpress() {
    sudo apt install -y wget
    sudo wget -P /var/www/html https://wordpress.org/latest.tar.gz
    sudo tar -xzf /var/www/html/latest.tar.gz -C /var/www/html
    sudo chown -R www-data:www-data /var/www/html/wordpress
    sudo mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
    sudo sed -i "s/database_name_here/wordpress/" /var/www/html/wordpress/wp-config.php
    sudo sed -i "s/username_here/wpuser/" /var/www/html/wordpress/wp-config.php
    sudo sed -i "s/password_here/wppassword/" /var/www/html/wordpress/wp-config.php
}

# Function to enable Apache modules and restart Apache
configure_apache() {
    sudo systemctl restart apache2
}

# Main function to run the script
main() {
    install_packages
    configure_mysql
    configure_wordpress
    configure_apache

    echo "WordPress and MySQL installation and configuration completed successfully."
    echo "You can now access your WordPress site by visiting http://your-server-ip/wordpress"
}

main
