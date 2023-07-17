#!/bin/bash

# Function to install required packages
install_packages() {
    echo $'STEP 1: Installing the required packages\n\n'
    sudo apt update
    sudo apt install -y apache2 mysql-server php libapache2-mod-php php-mysql
    sudo systemctl enable apache2
    sudo systemctl enable mysql
}

# Function to configure MySQL and create a WordPress database and user
configure_mysql() {
    # Create a WordPress database and user
    echo $'STEP 2: Configuring the MySQL Database\n\n'
    sudo systemctl enable mysql
    read -p "Enter your MySQL root password: " rootpass
    read -p "Enter your database name (eg wordpress): " db_name
    read -p "Enter your username (eg wpuser): " db_user
    read -p "Enter your password: " db_pass

    echo "CREATE DATABASE $db_name;" | sudo mysql -u root -p$rootpass
    echo "CREATE USER '$db_user'@'localhost' IDENTIFIED BY '$db_pass';" | sudo mysql -u root -p$rootpass
    echo "GRANT ALL PRIVILEGES ON wordpress.* TO '$db_user'@'localhost';" | sudo mysql -u root -p$rootpass
    echo "FLUSH PRIVILEGES;" | sudo mysql -u root -p$rootpass
}

# Function to download and configure WordPress
configure_wordpress() {
    echo $'STEP 3: Configuring Wordpress\n\n'
    sudo apt install -y wget >> activity.log
    sudo wget -P /var/www/html https://wordpress.org/latest.tar.gz
    sudo tar -xzf /var/www/html/latest.tar.gz -C /var/www/html
    sudo chown -R www-data:www-data /var/www/html/wordpress
    sudo mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
    sudo sed -i "s/database_name_here/$db_name/" /var/www/html/wordpress/wp-config.php
    sudo sed -i "s/username_here/$db_user/" /var/www/html/wordpress/wp-config.php
    sudo sed -i "s/password_here/$db_pass/" /var/www/html/wordpress/wp-config.php
}

# Function to enable Apache modules and restart Apache
configure_apache() {
    echo $'STEP 4: Finishing touch\n\n'
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
